Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0F29AF
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557725; cv=none; b=KxF5UhYiw1FtvEskLyiZAFsy+ASFQ5Az9c4QvxaiVkLT0/ILYdnjGGydqqap/gtqrdcz380aodru6QCUlYCn96fy5n28BIpoJ8g8XSsDiLU6f+ogSgmVyn5bQ3bhkJNuqw4A7zPOs/iqDjJtwn1lNAUtO37GbnR1m4cLKWOaEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557725; c=relaxed/simple;
	bh=WwiIGmhyGOdZon8LAJcoEDUYGTqw+cL2/HmhFVSNbQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C31n0RiSG1MURebAywuu8PTjagfrOhYyQh9DYuGhT9oqM+PiuPfMMF77o2chKLTrYb9io8MsBJHOHypXx/11Cu3me4Yb3NK8Auk+BUMQofJQ+ddpDQfx/kR7dp4Zeih7v14ajtD5GvxwWhLk8App/bvvu8WAimc+jGNkgiCev98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gag+hrsW; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gag+hrsW"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dde476d3dfso7364997b3.3
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557722; x=1729162522; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VGs/fU4SpegpQzbG2AYNWcbAGbbD3orYU7SBex+GqM=;
        b=Gag+hrsWCfKM1+fKB7edoN+VjtfGl7K5RgrPVeUs8sBi7xVF5HW9je1LCVy/ZfDvkQ
         Ydhic52tvQj94D7RGZ0lbcyVB8rSfuqUb7JGkReV4SlFK6gPlpHQpZqCElYlM72rx+lr
         epGf75tAI5Xv5dzzKruk/kMhTktd08RgQ/nh+Xu1vr0IAuwIR13GUz/FbJfJzRbXqfgz
         miNi7iWJu9oVj0NQaQxsG8bU+ZZDvDhik9zh8vk3rlnGsSZT2tPuflu8xEgOagsToqFv
         TlTvGR1r2gVaCIUA4toeZy8dp3xJ5AAtAZqS0FJpiHTSPBx4fSXV8PHJ9bcvD7zL/gEb
         Whpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557722; x=1729162522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VGs/fU4SpegpQzbG2AYNWcbAGbbD3orYU7SBex+GqM=;
        b=mI40juPK/Gq/tREc03JFULNzcHLk5ws9Bw/9zIZIbWsTA9VWlIASl1YJQuihIUjqVi
         JwNOfaD/9Z2W7HeS6emb6FNr6lra+vBPuqU1T/Kem9eMSw8XL7m51JrtifTW/1TzELje
         X+Pwwl+rUiicmTEAWcQekj+pXM/Smg087TdLDjTlWJOU3O1jQh9qIG0agIv/fVSN/NDd
         CNMmQzsmlaM5fLbAl6AwX+5EcG9rKP26IL4kogxw2OaVyupmN9Ro5EgL6cDAjOFZZdUf
         fAaYiDoqnOsSl4c1elPYnrkK+1j8Rz/Z7rZ/3cmCtxGkzJ3eyO8bgQx9hl42Hjd8bsbt
         +NhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJFixQqyVx4g897CP1RtNFYEphm4YWD/rG0Os5xrVw2VjX10IhaGC3gWRK5ocsY2qHZMsRbTd5WFuqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTp70Zrfl78kH4t3RgXJKKKoJ6uiwjGFZM55fO3x+tJ+KvsyXe
	XmqhGwU8hmN5eNSk9bqP/ytubaxnRNE47b4+o19E9U1+xmXh2ZZ7jobVcu//0kjHU9wtOtKrD8Y
	hNRssTdijb6Rf5vsXQRuXMegINdj8AWyvL+y3Pw==
X-Google-Smtp-Source: AGHT+IG1+R1ihC/1zJ5/CzYx7qkYB8pOlHdDW4xPGn5q3The6Ty0NU52LviZm5BHoiKxIMgoBbp/st/dwycsc6TdX98=
X-Received: by 2002:a05:690c:298:b0:6e3:36fd:d985 with SMTP id
 00721157ae682-6e336fdd9eamr4919897b3.23.1728557722397; Thu, 10 Oct 2024
 03:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com> <ZweoZwz73GaVlnLB@hovoldconsulting.com>
In-Reply-To: <ZweoZwz73GaVlnLB@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 13:55:11 +0300
Message-ID: <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chris Lew <quic_clew@quicinc.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 10 Oct 2024 at 10:44, Johan Hovold <johan+linaro@kernel.org> wrote:
> > >
> > > When using the in-kernel pd-mapper on x1e80100, client drivers often
> > > fail to communicate with the firmware during boot, which specifically
> > > breaks battery and USB-C altmode notifications. This has been observed
> > > to happen on almost every second boot (41%) but likely depends on probe
> > > order:
> > >
> > >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> > >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> > >
> > >     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> > >
> > >     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> > >
> > > In the same setup audio also fails to probe albeit much more rarely:
> > >
> > >     PDR: avs/audio get domain list txn wait failed: -110
> > >     PDR: service lookup for avs/audio failed: -110
> > >
> > > Chris Lew has provided an analysis and is working on a fix for the
> > > ECANCELED (125) errors, but it is not yet clear whether this will also
> > > address the audio regression.
> > >
> > > Even if this was first observed on x1e80100 there is currently no reason
> > > to believe that these issues are specific to that platform.
> > >
> > > Disable the in-kernel pd-mapper for now, and make sure to backport this
> > > to stable to prevent users and distros from migrating away from the
> > > user-space service.
> > >
> > > Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> > > Cc: stable@vger.kernel.org      # 6.11
> > > Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Please don't break what is working. pd_mapper is working on all
> > previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
> > qcom: pd_mapper: Add X1E80100") instead.
>
> As I tried to explain in the commit message, there is currently nothing
> indicating that these issues are specific to x1e80100 (even if you may
> not hit them in your setup depending on things like probe order).

I have the understanding that the issues are related to the ADSP
switching the firmware on the fly, which is only used on X1E8.

>
> Let's disable it until the underlying bugs have been addressed.
>
> Johan



-- 
With best wishes
Dmitry
