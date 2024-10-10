Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04552C2E9
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567964; cv=none; b=Ij3tx3tSWkDqLBQhbJ3VPZPKSPeYfGwMUH1mSgKK2g/biPmsHzlF/iZGAnIsev0olpBsVxHlGK41CHHGSq5ai8SwMVhRNP3kwb3S+CPiDuXeo3u/ZjSZvZLuYfJ0RGLlvVMyDAE5+b0x3+90Yw/sAigpabDAwYCnfs9P1UtenC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567964; c=relaxed/simple;
	bh=aqf6FA1ModO8YdrSAdH7Rvzvf/NsbPNUiAWY1Oybvx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4EOx1GGOESnHunIR1V8ZOvzmrf5tk1gpfhanaPOH/U28JS7ybG0v/Q7opa9duXSEDfQT6khhGgh95j6P7DJk2gop+p7oHrzJ4JyrdTkV0X3cRhKh4uMfWpvEeuPb0jBcD2Kl01S0uwEzFaqx+5wOA7/R5itkVuaS1HzFJsLAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZekh4ti; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZekh4ti"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so1846904e87.1
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728567961; x=1729172761; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=daYbA/IQ2VsUidG5QXueWwrgZDxCl0o/PDmc/HXVE1k=;
        b=JZekh4tiU6OBmrRWfJRFF3V7dzq7scXtFpsqAZCvqzUctIVDCcJRPPlOBq1NZ2t5M0
         yiKLAthLAr8xAdYAR/CGsTKWSXuCgq4YeWG6QhDplVGLU5GVandx7f2gb9EWmxA8sBck
         0GzYQ0SvyGHvEe5wc6tu2zEXCD2cq561v8382EcWzwTsETWQswUcWfnhhcoJuTg53i+O
         WCsIIDp3YxFyHYEJBu3xMNQF6JnTDTZ9IY/NO3B9MG1tN5xWTSD3Hp6NDMxGeiEGbAo2
         VvpjxYj7RmF4AwYI8/GWOaBzIszg0+kDwcEFAhMmWsJie5B7tukUJbMi5iK5b6UkDUuf
         ovCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728567961; x=1729172761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daYbA/IQ2VsUidG5QXueWwrgZDxCl0o/PDmc/HXVE1k=;
        b=IQjYgpFAtBKPoiAjwRVKQNICiwYC5UtWStLI4CzaUN6yC9ci9tXshYFmRxbfFvrB+z
         QeVE1xYff7NvDpbYsmoKrKhAUp4SpjMSLyyy36S6rTazwcXDQEdNeo6I92fLiylVTCKd
         nNvxrIVEEQcRm7NbBEaaeJ3J2SVO37LnO/U5syo9IILvgKkXfcz1sZr5Z6m8TI8UQYdj
         wnooFIei32FfywkWun7PXsMT6ErrGiVy9tlBFsIfgFrAXdg9VxEyRkNx45afEQkU5olA
         Oy1obCnwCAFSE433lrERAMkOecB5y8WH2oq3DkSrbkqmV1j8nTrcHC0FbjdUzKNLtjxU
         Kjmw==
X-Forwarded-Encrypted: i=1; AJvYcCXFWNEEeDD+sJHAEo19H15/BkBjH9lzPWHqUK9SXWefC56LpOtjtesbptL6ZykRtwtnK2BlrzoKrKMfgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya+zWk+bpgPRFTJZYxkkVq6uK7wvNirZqRzIX+8cAYddj85NQI
	DpKlXoSaXxdOSiyMapHJkd1CO0339DlSD98dCdAy08jL5Szv5Gd83GzZmfSYEF0=
X-Google-Smtp-Source: AGHT+IG8VZyQ2Csj/t2qN0rUAUd1Mt/8bM1qBklXVbOB/H5xxqv45UlS19dZiOWrZWbiyjsSdd4NFQ==
X-Received: by 2002:a05:6512:3f0a:b0:539:8ee8:749e with SMTP id 2adb3069b0e04-539c985a7f0mr1301444e87.3.1728567961166;
        Thu, 10 Oct 2024 06:46:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c10b9sm262053e87.62.2024.10.10.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:45:59 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:45:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwfVg89DAIE74KGB@hovoldconsulting.com>

On Thu, Oct 10, 2024 at 03:24:19PM GMT, Johan Hovold wrote:
> On Thu, Oct 10, 2024 at 01:46:48PM +0200, neil.armstrong@linaro.org wrote:
> > >> On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:
> 
> > >>> As I tried to explain in the commit message, there is currently nothing
> > >>> indicating that these issues are specific to x1e80100 (even if you may
> > >>> not hit them in your setup depending on things like probe order).
> 
> > The in-kernel pd-mapper works fine on SM8550 and SM8650, please just revert
> > the X1E8 patch as suggested by Dmitry.
> 
> Again, you may just be lucky, we have x1e users that also don't hit
> these issues due to how things are timed during boot in their setups.
> 
> If there's some actual evidence that suggests that this is limited to
> x1e, then that would of course be a different matter, but I'm not aware
> of anything like that currently.

Is there an evidence that it is broken on other platforms? I have been
daily driving the pd-mapper in my testing kernels for a long period of
time.

-- 
With best wishes
Dmitry
