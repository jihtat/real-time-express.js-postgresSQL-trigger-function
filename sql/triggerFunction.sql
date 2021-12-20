CREATE OR REPLACE FUNCTION public.out_of_stock_listner()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $$
BEGIN
	IF NEW.is_out_of_stock = true THEN
		 PERFORM pg_notify(
    CAST('out_of_stock_notif' AS text),
           '{' || '"name":' || '"' || NEW.name || '"' || ',' || '"schema":' || '"' || TG_TABLE_SCHEMA ||'"' || '}');
	END IF;

	RETURN NEW;
END;
$$;