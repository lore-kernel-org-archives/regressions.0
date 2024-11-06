Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6172038BF
	for <regressions@lists.linux.dev>; Wed,  6 Nov 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906241; cv=none; b=WG4j+7VO3sVkUugmn2zpIHMtaMK7Z7cz9vVqOOUzAhHaLUR/9CWKvbQPgXVRl3H+6cqxDjg2NNnxm/15mlY32l4rmtTm7iNzBssm3knQbBwwSHzoQ/dYOziUKirpvFF9YrGElmsxKCriN3XxYgcadwj5wNnfGfZ2w+0d/kLLMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906241; c=relaxed/simple;
	bh=ic8cVOX8Eb6eg3pSMbWKLDgRehM3KQGs7TIkjwW/x88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyR6wR7zMgsh0dQfQDK750lGo86eIiZfeI+rXYCqFXwFSJ3uS6/d6qdfhjKMj3vrQUifIl1LVQMsEYi/N2PmYWrugMLUNFABJzKAlxatTGMEBG0iqtDXQdQL4E3XUWG6grNuPVcYTOW7z6Z1xnsN9zJhLOHB2md7OBKaLMIml5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3TLJPCV; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3TLJPCV"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f6e1f756so7253952e87.0
        for <regressions@lists.linux.dev>; Wed, 06 Nov 2024 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730906238; x=1731511038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIEbwD5dLW8FMUuswU9FQws7jt6ecUWe6Cmn0F+XQJU=;
        b=N3TLJPCVb1uydJBnip9P4fb1bxOpB4ROp9FdjcZ2ks6+erZH/XGLRstOok87YZHyPB
         211xRMP3lAbR8I9EQNh3lb+6CVYHDvfaFTHqciUORa10yf+SG+VPZf3vxPH9ZZZ4UHwF
         2IRyAASmLcW6E9UWUd/qzID28B9hiza9dRTS69jltvBGJGchXnAtJJ41e8qAhueE/ao+
         +utDFLizsgwKkpLF4drmiBqU8Ijp2uz30Ktg/x8FTqfzW73yGU44kZS1L2fL8NPsjP6D
         oAIrXk2xjtQCfzAk7pUp99Nx1MZdJhJKD/rcKCdS+wJ6Q8dvr0Pe39oBeGhsc0ctGeY3
         p2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906238; x=1731511038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIEbwD5dLW8FMUuswU9FQws7jt6ecUWe6Cmn0F+XQJU=;
        b=jn3q/gDk1W3N4Z/zf3vWZHidn8apdayrtBrrv23FGPbzkvYC+GV40uW7TM6wMTCpuh
         kt55BEgyuk8nMd59kGlBQtcREZHHVPyduHHZZGWUsjuwVwkeoAHA1PY/1tgUEWqzLK3+
         BMTtbC0lhQdRgXxhNJw0wMlAJn3m9kaomsizPIaRRHiQaTaxm/hDWnygEO+6Xs2Hs8kM
         1LlB+i1z6oR7wNgGu29Z0dtOXXftujwYI4hM0qutxTDajRLk5AD697Hc2sGNpM3wGwyu
         CVW0CLKfeMXbeCQy/bqZzUJRWT42EWfGHImcsE4lqoXuyEUrozIT/41ZQRw65k7oNUyw
         k9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1x78aRg3/fYM0pDumA3NqJTjiTy8ga4rbrnA/1vFah7uUc2S0fD5XCs9GesIHjS4ldHkZzcYvi9xSMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp42K4n+733zYVpTrcBV0u+K2omH0iT6ekGKZTLu6VdhTJGJhf
	l+C7eyXMuYXBjSW4faqYKooAhuZzsu334izJ+N5w+ElSFa/7nVGTMCOrQdt/5Uk=
X-Google-Smtp-Source: AGHT+IG7dwaa2yN3o8y7YIOO0cvRLcrkbQ+DzFVy+RFiOkuyFesN3/6MQCXs3ZxexqpX8BK5K41+LQ==
X-Received: by 2002:a05:6512:3b1e:b0:539:f37f:bed9 with SMTP id 2adb3069b0e04-53b348c38d4mr21239539e87.8.1730906237946;
        Wed, 06 Nov 2024 07:17:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc305sm2520122e87.227.2024.11.06.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:17:17 -0800 (PST)
Date: Wed, 6 Nov 2024 17:17:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>, regressions@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100: enable OTG on USB-C
 controllers
Message-ID: <5mfq3xf2qkqyrtaybtfutx73rny737rqdd6exdbhljcebg7brs@fxaz6zhsy4pd>
References: <20241011231624.30628-1-jonathan@marek.ca>
 <hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef>

On Wed, Nov 06, 2024 at 02:37:43PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 11, 2024 at 07:16:21PM -0400, Jonathan Marek wrote:
> > These 3 controllers support OTG and the driver requires the usb-role-switch
> > property to enable OTG. Add the property to enable OTG by default.
> > 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> For some reason commit f042bc234c2e ("arm64: dts: qcom: x1e80100: enable
> OTG on USB-C controllers") seems to break UCSI on X1E80100 CRD:
> 
> [   34.479352] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

#regzbot ^introduced: f042bc234c2e

> 
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 7778e17fb2610..fb16047d803c9 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -4199,6 +4199,8 @@ usb_1_ss2_dwc3: usb@a000000 {
> >  
> >  				dma-coherent;
> >  
> > +				usb-role-switch;
> > +
> >  				ports {
> >  					#address-cells = <1>;
> >  					#size-cells = <0>;
> > @@ -4452,6 +4454,8 @@ usb_1_ss0_dwc3: usb@a600000 {
> >  
> >  				dma-coherent;
> >  
> > +				usb-role-switch;
> > +
> >  				ports {
> >  					#address-cells = <1>;
> >  					#size-cells = <0>;
> > @@ -4550,6 +4554,8 @@ usb_1_ss1_dwc3: usb@a800000 {
> >  
> >  				dma-coherent;
> >  
> > +				usb-role-switch;
> > +
> >  				ports {
> >  					#address-cells = <1>;
> >  					#size-cells = <0>;
> > -- 
> > 2.45.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
