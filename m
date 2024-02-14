Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D318E20
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707908915; cv=none; b=rD59rA3r+7fuNG+7y18p3w87SGta1u29icLxSM1sA0Bf2aG9JeiJoa/YtqKTvvCimn4e8yInxuV0GDNUnLINp9XgVdyCgrbVpH9b0zSa6OMBGr1/72Ua2XHyCjKsuKW8/U+/59sTHz5tqVVjJ5J/f+noQqDp/Xi8hPTNCa6JpEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707908915; c=relaxed/simple;
	bh=ahxgnHl6wwjnMBlOUGMVFfFjqVZi1UEqGBBd6507YKE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abgoGN+Faat/Wvsp3KQC25MHjgfhiMJ/a89GF0rEP9p6Or2948JD84ONS0mi4ZaaowgV5WXVf9Pv/YzHus6DXF1D9UyvxJfguct0cepPa+mWFaUdd6wOLi4ZMURh6GV3dRuw5GNyRURbd8KAAZKQ+iMvQbK3PBdbGODx4Bjex4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=j7blez5w; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="j7blez5w"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B621B2027C
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 12:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1707908911;
	bh=axTv99IS801OjdzUxYMHquESbddfegYE+mYMS6WnSy8=; h=From:To:Subject;
	b=j7blez5wFiDufYWmvLN80w2blH+/BFKmdwnoDuEiqoOUjam7lz7qWCMHMtQZd9yuT
	 oyrfAetZ6LHg3KnLncVqj1ck3jeoBraMdMJCEN2tRqCpaUe3kQqi97HIS0jsnuYpG8
	 Bwob06ebUlgyOtocER4QpNSg7j0by9uzzGXT295RABMs3oy3GF0Hrv7WCEwLAkVQKV
	 u+h2yDZLXX8yKcXOyR41Vux6icpMrFiS8HEbNFsvxsB439tOsKbE3e7TnGegq7flnI
	 AXfLITPH7u+Aj0ehTXwcT0NbnbXsRYDosSHSEnw3960F0wWzNcKImNISlZ1GgYa0Nb
	 AYYuCVOjfE4rA==
Date: Wed, 14 Feb 2024 12:08:22 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: regressions@lists.linux.dev
Subject: Re: MXSFB error: -ENODEV: Cannot connect bridge
Message-ID: <20240214110822.GA81133@francesco-nb>
References: <34yzygh3mbwpqr2re7nxmhyxy3s7qmqy4vhxvoyxnoguktriur@z66m7gvpqlia>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34yzygh3mbwpqr2re7nxmhyxy3s7qmqy4vhxvoyxnoguktriur@z66m7gvpqlia>

#regzbot introduced: edbbae7fba495284f72f05768696572691231558

On Thu, Feb 08, 2024 at 12:58:02PM -0300, Hiago De Franco wrote:
> Hello all,
> 
> while doing some tests with kernel v6.8-rc3 and Colibri iMX7D, we
> noticed the following error:
> 
> [    0.432547] mxsfb 30730000.lcdif: error -ENODEV: Cannot connect bridge
> 
> This was introduced by commit edbbae7fba495284f72f05768696572691231558
> ("ARM: dts: imx7: add MIPI-DSI support"). This patch is routing the
> lcdif to the mipi_dsi_in_lcdif endpoint, however we do not have the DSI
> pins available in our edge connector. Instead, we use the parallel RGB
> LCD interface directly with, as example, an external LVDS transmitter:
> 
> &lcdif {
> ...
> 	status = "disabled";
> 
> 	port {
> 		lcdif_out: endpoint {
> 			remote-endpoint = <&lcd_panel_in>;
> 		};
> 	};
> };
> 
> By applying the following patch, the issue is gone and the LVDS works
> again:
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> index ebf7befcc11e..9c81c6baa2d3 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
> @@ -834,16 +834,6 @@ lcdif: lcdif@30730000 {
>  					<&clks IMX7D_LCDIF_PIXEL_ROOT_CLK>;
>  				clock-names = "pix", "axi";
>  				status = "disabled";
> -
> -				port {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					lcdif_out_mipi_dsi: endpoint@0 {
> -						reg = <0>;
> -						remote-endpoint = <&mipi_dsi_in_lcdif>;
> -					};
> -				};
>  			};
>  
>  			mipi_csi: mipi-csi@30750000 {
> @@ -895,22 +885,6 @@ mipi_dsi: dsi@30760000 {
>  				samsung,esc-clock-frequency = <20000000>;
>  				samsung,pll-clock-frequency = <24000000>;
>  				status = "disabled";
> -
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					port@0 {
> -						reg = <0>;
> -						#address-cells = <1>;
> -						#size-cells = <0>;
> -
> -						mipi_dsi_in_lcdif: endpoint@0 {
> -							reg = <0>;
> -							remote-endpoint = <&lcdif_out_mipi_dsi>;
> -						};
> -					};
> -				};
>  			};
>  		};
> 
> I would like to know your opinion about this patch before sending it,
> does it makes sense for you? I understand that routing to endpoint
> should be done in the SoM device tree, so we are free to rout other
> endpoint without issues.
> 
> Regards,
> Hiago.
