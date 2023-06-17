Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A015231
	for <regressions@lists.linux.dev>; Sat, 17 Jun 2023 07:22:00 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-986d8332f50so124413566b.0
        for <regressions@lists.linux.dev>; Sat, 17 Jun 2023 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686986519; x=1689578519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjXSmylfvJ9wJt437Uf//TtaIsBaLnBZp/3Ml1w3C3I=;
        b=yHBWeC24+nXPeU37O1qJgm8rAzoFg76b8+TqcnfZUv5dYdZkOfVs0rhdwVWbC5V0fN
         q28pRqeLZLRBZNuZtjDwZYy4pPNfLLkqxdblO4oOXUudZdgELeCWRFsuyVtmT7FuQI9/
         JtDp4YBcJzfEgPGuBEStRZbbln/t2TPQYzQPQwId3J1JryHGeFM6q1xxSY/kwFinQ6Ot
         dx0A39gLOvfiUv+mA4YxXRnXaPDGUpdLje0R6pNS80HDKaz+cUkYjjI7msih9jQKeXUN
         ggDp2ht8pJF0nomgooJ0OAyMMrHnkTyVHSeEugRtAYwW3fbdMg25q9vHiuU+o+99SSLP
         yUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686986519; x=1689578519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjXSmylfvJ9wJt437Uf//TtaIsBaLnBZp/3Ml1w3C3I=;
        b=AWkcMgiIVay6aS9jIs7npUdHcDanLj+geQdvJEsbC0gdxgpi7Cp/XXtDzFBr/QRaTD
         6U2uBH8Bc+TAS3AsPisTahBjaZmrddtB7YI0dg9mcfWS95yPK2Uj0YD2APBfM8bTTdzC
         zP5/Om3lXBIOhcy1dVOQ7Gvsb7hdsi5pKMDTzcMLmh060Ewxxf+22H7sHY8XKa/0qBx2
         bqT6nqor7PefdlHMlQSvVLgW4YrYyuCsiUtMa0sgRab1l9B8h35FYk6IafxHLjlmVFfk
         YF3jJVdHf7W1Xt84P6i9XEv5E9HPMR9mbrM5mF7pT6IXobT8lQwFcJ84UycADy4CyH5P
         FilQ==
X-Gm-Message-State: AC+VfDzr67glf+lJGBxqRb7XrKbYx6dxBTvUfl/6rjQmUD6kDp/8pYuz
	FmyJbBjVeSPJeeutG/KbHIhP5g==
X-Google-Smtp-Source: ACHHUZ4vncMEFaT77el4Fw+e6+SIxuUCOeI/uc/vZiQfRucC3BHCi0YlfIAHeqR+DNo7mKqVjAbKIQ==
X-Received: by 2002:a17:906:ef0a:b0:978:337e:c41a with SMTP id f10-20020a170906ef0a00b00978337ec41amr3750891ejs.14.1686986518710;
        Sat, 17 Jun 2023 00:21:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m15-20020a1709060d8f00b00982aa9db473sm2965074eji.55.2023.06.17.00.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 00:21:58 -0700 (PDT)
Message-ID: <fbe5138f-fe97-11ee-a14a-4bb447c0972a@linaro.org>
Date: Sat, 17 Jun 2023 09:21:55 +0200
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
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
 <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
 <CAMi1Hd0=KV7k82ARadF45nqX+Cv6zPLCxfDvOyAPeXiFd8jpVA@mail.gmail.com>
 <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org>
 <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
 <12d6b687-5e5a-bd7c-ff5c-007a74753edb@linaro.org>
 <CAMi1Hd2H2aA6EYp5-46dWe0eu0_hAWUumoQbnk7WR0q9bhppog@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMi1Hd2H2aA6EYp5-46dWe0eu0_hAWUumoQbnk7WR0q9bhppog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 19:09, Amit Pundir wrote:
> Hi,
> 
> On Fri, 16 Jun 2023 at 13:57, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>
>> So you have interconnect as module - this is not a supported setup. It
>> might work with if all the modules are loaded very early or might not.
>> Pinctrl is another driver which should be built-in.
>>
>> With your defconfig I see regular issue - console and system dies
>> because of lack of interconnects, most likely. I don't see your WARNs -
>> I just see usual hang.
>>
>> See:
>> https://lore.kernel.org/all/20221021032702.1340963-1-krzysztof.kozlowski@linaro.org/
>>
>> If you want them to really be modules, then you need to fix all the
>> dependencies (SOFTDEP?), probe ordering glitches. It's not a problem of
>> DTS. Just because something can be built as module, does not mean it
>> will work. We don't test it, we don't work with them as modules.
> 
> I do somewhat agree with most of your arguments but not this one. If a
> driver doesn't work as a module then it shouldn't be allowed to build
> as a module. 

Of course you are right. That's why I am pushing against blindly adding
"tristate" by everyone working on GKI. Because such folks like to make
them tristate, but not actually test it or work on issues later.

That's exactly the case from Google and Samsung patches here:
https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/
and in previous submissions.

> I took a quick look at the history of the interconnect
> driver and it is tristate from the beginning. And not converted to a
> modular build later-on like some of the other drivers to support GKI.

OK, maybe it was never actually tested. Or maybe some versions were
working on boards where debug serial does not have interconnect, but new
chips just followed the pattern without testing?
> 
>>
>> It's kind of the same as here:
>> https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/
>>
>> I understand that we might have here regression, if these were working
>> as modules, but I don't think we ever really committed to it. We can as
>> well make it non-module to solve the regression.
> 
> Sure. But since v6.4 is around the corner, can we merge this
> workaround for now, while a proper fix is being worked upon.

DTS workaround? No. I don't agree. Once it is merged it will not be fixed.

I am perfectly fine though with making the interconnect or even rpmh
regulator bool instead of tristate.

Best regards,
Krzysztof

