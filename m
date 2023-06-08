Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9F410973
	for <regressions@lists.linux.dev>; Thu,  8 Jun 2023 17:27:07 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-628f267aa5aso6073676d6.1
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686245226; x=1688837226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4iHIyxI1wD4Umf7hLNGOpALbyhbydhr+kR4iE7/CAzc=;
        b=Md59kBzOyPnMy+yguKEc2jnP2maIe8uzD/sWHmft4wKLdLD9cADn0DLgTIUv4bt8Xm
         6uXG4u1Y3eTWZW2KY0X5rf3FIgdg66UpoK9YZLsMWNAvW7ZxMFe0fvOxj0q1EqSnqE1B
         f762gyDVXPb3vutgnLs5+poK5+I2U2uqIsgFYbn5q1o33fu6NAkG/An8tJcrj7LELMeQ
         uPyTJtzFgqRTiTzrjhHK3gjySR4rgEZyMp8tbJf+d4fD3tzBxNt7ik3R0NZwnppaPEgR
         qvxmmCn9GYC1WdrNTn8MG5V4XvnUHrQFumZoImXtyu0FMZk7S9QdrCVSikxzq0All6g8
         8pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686245226; x=1688837226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iHIyxI1wD4Umf7hLNGOpALbyhbydhr+kR4iE7/CAzc=;
        b=H9O62LSh4CitLx9fcFLK94JEtaFGfG70gGogOD8CC/2qHkQ6i8E+fSSOycG70YJQCH
         6EsvTUms/LvQmbZndL4iJ1PFhG+ekHkXo0FEIFKWWKvX8f7MVac4ENADarpiszRAwXeD
         YPddNrQMizRh3AtCAG/G3n6VT/ktuHIXcYMhXJWLpdlD3c1ZGIdjIAjeavANERe424ZQ
         Mt5yrT/9PtOwHhaY2AyVVxZlXLVL5JDoDVgbfTNSDKQJxOONR+Fcr6shN3cCUOlEwLSx
         Dmbvd4gKYKbSYX1qYfWvjX9LWW49iLFTilXFtjrQlf0dQ2fqmB2fqSt79HhA3CphR6lU
         YiHQ==
X-Gm-Message-State: AC+VfDxOHi9LROxk319sX+YiY2SHzLcGvlXktoXkPtyqhHovcdBQ3nH/
	xIRGd+Xp92oyyneLVZTtlqEd3VTfZRbaOGZI5COtgA==
X-Google-Smtp-Source: ACHHUZ5hEP2TkSwruLFkZaYNvidX+ZAt7xPw6PU8FwgM974sDzsLhrEMTzEiKmEiaJHuZ5U/2BRrbRjXWqRO3kh9Slc=
X-Received: by 2002:a05:6214:2688:b0:626:e55:dfb2 with SMTP id
 gm8-20020a056214268800b006260e55dfb2mr2730635qvb.39.1686245226103; Thu, 08
 Jun 2023 10:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
 <d0dfdfba-7a70-7d12-2c30-ad32b3f95bb8@linaro.org> <CAMi1Hd1Upo8zV4MPtdqHgEaMQ72yK0gZgf5Z4uOaqKqhw8Hndg@mail.gmail.com>
 <55f07600-3fa5-f3c2-eb3e-e87a57244812@linaro.org>
In-Reply-To: <55f07600-3fa5-f3c2-eb3e-e87a57244812@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 8 Jun 2023 22:56:28 +0530
Message-ID: <CAMi1Hd0qRrRw3_U7kqz-8BJnwJR1RqweajBWrZWWDGmtqVMDAQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	regressions <regressions@lists.linux.dev>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jun 2023 at 15:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
>
> The problem looks like in missing consumers, missing probe dependencies
> or something in the driver how it handles these.

Missing consumers seem to be the case here, if I'm reading the
$debugfs/regulator/regulator_summary correctly(?)
https://www.irccloud.com/pastebin/raw/2jwn0EQw.
lvs1 and lvs2 sysfs entries in /sys/class/regulator/ do not list any
consumers explicitly either.

Regards,
Amit Pundir


>
> DTS should not be used for solving OS related problems.
>
> Best regards,
> Krzysztof
>
