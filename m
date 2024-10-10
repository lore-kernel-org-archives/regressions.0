Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A11D0F52
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571333; cv=none; b=nzJ+Jx1kroEj35QPKIjRm/0LPC8jTTeHdpza5JGpUO7XsF1Nya3y8izJ8JFJm6LXJxwlka/dsiHqpK/7jIeh46WDqo6o1L6R0TQDg2IQotBBnxSNSgF0qvVFn2VQAgWxxVnhpe3Y0BsC3LqYUvcftyg8iCZMC4HL0L2bKVYtzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571333; c=relaxed/simple;
	bh=J8h7ZogSRVYi3JZp242VuIB8P5Hx5C5R4FBhWsIGOgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Npqm0cNYlAo1WN2Ip8SXCzXkk7WIbwgqSTUtVQGbVwBbSJ9o0Bv5X9v4NPtD1bd45WDGb+y0cW5fDdKGjMRI62e67lgQ9lMcU4bsXTkoqjnOK7XpCOpSh+WKn00rM2h9sZF2/MqDhjz1ol6mxXGAS4SG1hAL0lWZqL5x8kRWEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c203Bhav; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c203Bhav"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso14790451fa.1
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728571330; x=1729176130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSCYi8JcMLXDaF73CrzXwPeVuGXfVTJYUL9WPyu/FF4=;
        b=c203Bhavzqcq9AJc8t/dOcNhSUFFGRf7iNWbPY7THAClgEAqzdBiOBsaPLHEYjocmp
         GmXYefY5fLq+9+q4S6U2JGU+XCaYSjbpVJv4/HhZtPc4ZnY379uzTHzibFM9F/qBUcCv
         HFVKexQuAUM9xDLwdaY5pTMkFbS1pJAU6oGeuGQL6DlNDBT6T6V+fz/dDwuup0scM1wV
         hJOHmsqRa0xW9FBZkhaokXbJTXGnn3Izoc5FuEoKajCMPDhDpfKXy/tUkrTAKrJKz30C
         xzseySQyryotZ04JELHi7l151THhvGpDu74/YHjCmX0skHPTRhfuznGPlhC0XLNZd3sl
         B+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571330; x=1729176130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSCYi8JcMLXDaF73CrzXwPeVuGXfVTJYUL9WPyu/FF4=;
        b=mN/DonVHcvHhFfzGku2HQeIlbxvyd8dfBSeHlnNfuQHmM7dYHDus54Iv5KrOfqnwBF
         kaUQwc4iSNf6RkknVF/MQlvF7HcnlKbABAtRJolwnG80lrBi5Bz9+kEkCNZuyPz2Nl2B
         5Enquea5xSfisNx+D7rTTPP2QSRSBo4/Be9srK2m3sWkqZa12DDZH+O2jL0OFRA8t66a
         yi1Bp7gvFt3RkpWnrChMDiHxuDkb9Jfa3yMoJuNO/4D7wvJgNBC2DcsJtLAEpG/vscK0
         3ABDUwP7dRBXM/1RbszpzXw3O+VbZTay8a5ybyIFvefhitZyGZiVuSQJ/x+x5kr7elBa
         F/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAFoqr6nGKZ8XXA9dg5OC8voqclWn+iuYJFe6kzqgaOgsIRXKbTlFliBGcmTtlMmplfuYgl0asvPX/Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlspr8B2kjrUz5O2A4FxvOm84ByILCI+E/EVJX1Xc6wSUAJzSO
	rmQzeq0l930fXMhEnMPRGOZfDE75UgnwmMwGwnTZBegIwhS1h65hzj1jvfzEkjY=
X-Google-Smtp-Source: AGHT+IHTXbpgPQx1CNya5s++GATNvkC8R0h710vIpZWBj7Fxa5x0RbTR+gUaQHMlnVb3y0lAfmds6g==
X-Received: by 2002:a2e:be23:0:b0:2ef:1b1b:7f42 with SMTP id 38308e7fff4ca-2fb187e7de2mr63367001fa.36.1728571330142;
        Thu, 10 Oct 2024 07:42:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459c93esm2249621fa.55.2024.10.10.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:42:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:42:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <2fqd3hkj7j2lppxzfl2fjfzrik3jql2gk7chexaajeybcrz3kc@rvx565zzmlmp>
References: <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com>
 <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
 <Zwffi40TyaMZruHj@hovoldconsulting.com>
 <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>
 <ZwfiuJW1gkYPFic1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwfiuJW1gkYPFic1@hovoldconsulting.com>

On Thu, Oct 10, 2024 at 04:20:40PM GMT, Johan Hovold wrote:
> On Thu, Oct 10, 2024 at 05:13:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 10 Oct 2024 at 17:07, Johan Hovold <johan@kernel.org> wrote:
> 
> > > Yes, Chris's analysis of the ECANCELED issue suggests that this is not
> > > SoC specific.
> > 
> > "When the firmware implements the glink channel this way...", etc.
> > Yes, it doesn't sound like being SoC-specific, but we don't know which
> > SoC use this implementation.
> 
> So let's err on the safe side until we have more information and avoid
> having distros drop the user-space daemon until these known bugs exposed
> by the in-kernel pd-mapper have been fixed.

Then default n + revert X1E sounds like a better approach?

> 
> Johan

-- 
With best wishes
Dmitry
