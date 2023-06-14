Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CAA7F
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 18:47:05 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-977c89c47bdso163498266b.2
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686768423; x=1689360423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2dmijlndEPPYs5IElMJtslUllIfqF2D+1pCU/iVRps=;
        b=RYB/dfvGhjvnwSjdBgId9QXaGPAml67loM9d/fKuSNJGk/pke4Id3mL8bttl7LJ2rt
         asd0STpv2pxsQmmhLRwvoESTFQd7HCS+WFQgrpYwtGBFJ98SH9ZWb5Fv/IgZ0ftmT0+3
         QNCxGhNExMqqLfP8mfkRrNO1FR0Yd+4NVi1vm20ADoOhpAhPOb4PHocDWTOyHfYsHWQS
         UC7GFLZLZKx92SOiJ34UMAiRyGt8Iwras9MOBKmDaDC0PXHXkJXg9Ds68St81OIwN+DR
         /0PFa/IO5ubVynX/tfN9DjCcbYX11n5s5tnyQGRR7kvEgOSTLynq7j+80zPDkTi91iNr
         C2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686768423; x=1689360423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2dmijlndEPPYs5IElMJtslUllIfqF2D+1pCU/iVRps=;
        b=aaDOAO5txEAK0QZPwRaZ8kYoC9ejnmjcDc8CLxMTY27T4VOcgTSb3d2PpSvsFpu25C
         nWcWt61J1E6lAx5q2zoGbcEcS9/SMEsEdnbHN/13/u193FKU3SnGJ4PrJu4kQtu72Ur7
         apUVxjUKwQhWl51WfbvbV14ElAqgpqGU800yU1Wvh5aYlxpWpUaUIg7DeWnyxylCGUyJ
         id65Q+Y3rR5QvOb16Muc+sr7OdeBBXyKYfJvACTxO/3I5CdqvAzLZcKj6Eu7C3XJS9NF
         Xy0jYK9qlPOGTV3aG0DWg3hbJ8b2NMj8C//gcu1sVAMggIEpnJAwb0/t/mRaSTVQrHMI
         SiCA==
X-Gm-Message-State: AC+VfDyVbBRNpwNB9mRhWHsi1tBavUjVFGm/7mVpFt38yOmPge/ZEGrM
	bGye9TKAoeCmPxAwmJjxjTr0OCwM9xxBGvfxAQI=
X-Google-Smtp-Source: ACHHUZ6QGzBwXZPm7LGg97zkIBeIUyBNwZ3vpxzJcuCyRyUliDdiMyVINRNKkhdi4RE0ju7HAKTnSw==
X-Received: by 2002:a17:907:6e10:b0:974:5ce6:f9ff with SMTP id sd16-20020a1709076e1000b009745ce6f9ffmr17870176ejc.32.1686768423459;
        Wed, 14 Jun 2023 11:47:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906045a00b0096fc35ca733sm8258831eja.41.2023.06.14.11.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 11:47:02 -0700 (PDT)
Message-ID: <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
Date: Wed, 14 Jun 2023 20:47:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes
 up
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Amit Pundir <amit.pundir@linaro.org>, Mark Brown <broonie@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.06.23 18:12, Amit Pundir wrote:
>> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
>> list to workaround a boot regression uncovered by the upstream
>> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
>> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
>>
>> Without this fix DB845c fail to boot at times because one of the
>> lvs1 or lvs2 regulators fail to turn ON in time.
> 
> /me waves friendly
> 
> FWIW, as it's not obvious: this...
> 
>> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
> 
> ...is a report about a regression. One that we could still solve before
> 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
> sight.
> 
> When I noticed the reluctant replies to this patch I earlier today asked
> in the thread with the report what the plan forward was:
> https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
> 
> Dough there replied:
> 
> ```
> Of the two proposals made (the revert vs. the reordering of the dts),
> the reordering of the dts seems better. It only affects the one buggy
> board (rather than preventing us to move to async probe for everyone)
> and it also has a chance of actually fixing something (changing the
> order that regulators probe in rpmh-regulator might legitimately work
> around the problem). That being said, just like the revert the dts
> reordering is still just papering over the problem and is fragile /
> not guaranteed to work forever.
> ```
> 
> Papering over obviously is not good, but has anyone a better idea to fix
> this? Or is "not fixing" for some reason an viable option here?
> 

I understand there is a regression, although kernel is not mainline
(hash df7443a96851 is unknown) and the only solutions were papering the
problem. Reverting commit is a temporary workaround. Moving nodes in DTS
is not acceptable because it hides actual problem and only solves this
one particular observed problem, while actual issue is still there. It
would be nice to be able to reproduce it on real mainline with normal
operating system (not AOSP) - with ramdiks/without/whatever. So far no
one did it, right?

Best regards,
Krzysztof

