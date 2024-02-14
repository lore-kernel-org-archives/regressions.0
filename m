Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFA79F4
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911516; cv=none; b=YUgzt46tfJDgdh0Z47jdS9wfX/IHTcCSPah2rgjzmogPEiNQjFoZaGLgYGDdNbOnzvusCA2Qn4u6xn+Ed1+7lmGNJCRAHtitYjY+CSEsmhotpCgvdjMpQJfvxFb/vEhpAm+oQ7Cnz8+0Kc8OijIIs+EZVE6HGfJVSU5T5Umb+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911516; c=relaxed/simple;
	bh=Or2GPqytwU+Zewrk8JWKgiSLAr3eQDtgJFOhMN8XROI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYrVs68WB6saKqvMrv7rO8+J/XK5C4NrRXQ4giaPY1wzRagUM5crMBBPgf3Gm7SmIc27GT1/M8MicexNX5tiVGaqarQ818smnmwCehI9ImQ/WPLWy+rRaswYuiaswZR4oW+6jheMMM2+aO42bIXVQeeApZRKRV3CnHn+cA9t+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=EJCVcw+S; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="EJCVcw+S"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B94F620A66
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 12:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1707911511;
	bh=UKrz+HQUdzEtpwfdfugiFFexnnYi2nKtg/L0NiZ0Xms=; h=From:To:Subject;
	b=EJCVcw+ScTjWtCYalGyCSZ0N4P1cRtZs9zYDDvQFISSeqDaPFlboTLVS2GrVzNDVa
	 A6dxd7zLnqTstoQ7Ynt5DwmwRB/s3Ot0T/QSVYYBEfUYD4mmWEfCq3j2CmXGxbvzK6
	 YZ+eaf1sHxRyxAzs7XIn2uhl27jizknKa/xQl83Ewu9tgHlDwtyUNSZOcmYNzjhXFX
	 loJJoveckMrpZMdGoTD04eVg53D8pKMQ3O18x31ZE0dxQYCXjw4WFztMjwXvUQJOtj
	 VHMRVHNp08My2sVI5XsQM2vDPPUFYV4g5vs5iyBOaV90jpG+TZwGDHW8+vMdS3Smyg
	 GKHFU4/mHYQyA==
Date: Wed, 14 Feb 2024 12:51:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: regressions@lists.linux.dev
Subject: Re: MXSFB error: -ENODEV: Cannot connect bridge
Message-ID: <20240214115147.GA95390@francesco-nb>
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

#regzbot ^introduced: edbbae7fba495284f72f05768696572691231558

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
