package Front.modelo;

public class DteVentas {
	private long codigo_dte;
	private int cantidad;
	private long cod_producto;
	private long cod_venta;
	private double valor_sin_iva;
	private double valor_total;
	private double valor_iva;
	private String descripcion; //temporal
	private double valor_venta;
	
	public long getCodigo_dte() {
		return codigo_dte;
	}
	public void setCodigo_dte(long codigo_dte) {
		this.codigo_dte = codigo_dte;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public long getCod_producto() {
		return cod_producto;
	}
	public void setCod_producto(long cod_producto) {
		this.cod_producto = cod_producto;
	}
	public long getCod_venta() {
		return cod_venta;
	}
	public void setCod_venta(long cod_venta) {
		this.cod_venta = cod_venta;
	}
	public double getValor_sin_iva() {
		return valor_sin_iva;
	}
	public void setValor_sin_iva(double valor_sin_iva) {
		this.valor_sin_iva = valor_sin_iva;
	}
	public double getValor_total() {
		return valor_total;
	}
	public void setValor_total(double valor_total) {
		this.valor_total = valor_total;
	}
	public double getValor_iva() {
		return valor_iva;
	}
	public void setValor_iva(double valor_iva) {
		this.valor_iva = valor_iva;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
