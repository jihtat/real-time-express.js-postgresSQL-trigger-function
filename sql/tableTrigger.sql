CREATE TRIGGER out_of_stock_notif
    AFTER INSERT OR UPDATE 
    ON public.product
    FOR EACH ROW
    EXECUTE FUNCTION public.out_of_stock_listner();