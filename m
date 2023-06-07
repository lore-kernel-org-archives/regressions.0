Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E334D9D
	for <regressions@lists.linux.dev>; Wed,  7 Jun 2023 10:16:59 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51458187be1so1179883a12.2
        for <regressions@lists.linux.dev>; Wed, 07 Jun 2023 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686133018; x=1688725018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHtmIDD4uaTq4ABNxhYKW6qHDGlLDL1+HvFDCmmnPDM=;
        b=aMzYf6YMdsw58k4/wDNtAfJLXXqxovmskhmugL855D5kSCqCJjdRY+o2q8WTho6dy7
         r9INUS6z3glv3VuHQ+s872OmExPym88zOxwEvr66swh/5vYkAiY0wmzn9BsHFRaGXrzh
         vb+DSlYUKFwAYBznX2p3t+gpnGYKxtQoakYYUy0FkUHDsJ6MCLoqTK2NgY5sMntJHOn+
         TImv1OfDcFMGIvEkZ+iLp+bZy7I3Gz0WXSEbefn8Akij7Lhv6wat8MqIUfNGInASKTbj
         4cyhJjHxqVwQfYg4mjvBWhkGuZI1dWIH/4f/E4JGdBy5nxV2T+Pi6k2mDkG1ws9foy5w
         9Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686133018; x=1688725018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHtmIDD4uaTq4ABNxhYKW6qHDGlLDL1+HvFDCmmnPDM=;
        b=Do0rgt5A1lurQidHiB4V3m88g0LiMt1nMTAH4Qo6yzk5ttjVQBMjLwlW3sfdlAurMe
         R7Whv1J/kMj21r3H/8wtuO+WplBdFdcl9+g35TzM7iQSKMwuSuVRsJ10Slc5fz4TPkOQ
         7839atSn9fpnlBS/RA5yUewVZbD6EzoEpam6tR8a9l4HPJatEcfQvFJZ/7Nlx0fhsDpD
         QUEp8DEj8LF6Kc7Uk4cO1xf4hkzKYSBYCzTiM5SuEh5YxyxzS31oHkMNfPdFwNO2fFoO
         4xJ5YdU+c3NA0Dkh/HLuOV0baXzf4WOQsR3WR5FPFPAKnzVYlrz8beEZ5fHdpu9nTw5n
         hsZg==
X-Gm-Message-State: AC+VfDzwvlgaEkMC0c2or1O42mUaQGmaH3WW39U5FGTrYS14PUjVq6el
	MCbQpgV52geG/B/h59ioNghI8g==
X-Google-Smtp-Source: ACHHUZ4lRRxrWth26CaqnLWO9ge6gORx93AXTbvI8KrjJTI8Zd7pTHxYuR04YqlYa5SlHY4O/9m+EA==
X-Received: by 2002:aa7:d315:0:b0:510:82b4:844d with SMTP id p21-20020aa7d315000000b0051082b4844dmr3980381edq.2.1686133017905;
        Wed, 07 Jun 2023 03:16:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w15-20020a056402070f00b00514bb73b8casm6158198edx.57.2023.06.07.03.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 03:16:57 -0700 (PDT)
Message-ID: <55f07600-3fa5-f3c2-eb3e-e87a57244812@linaro.org>
Date: Wed, 7 Jun 2023 12:16:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes
 up
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, regressions
 <regressions@lists.linux.dev>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
 <d0dfdfba-7a70-7d12-2c30-ad32b3f95bb8@linaro.org>
 <CAMi1Hd1Upo8zV4MPtdqHgEaMQ72yK0gZgf5Z4uOaqKqhw8Hndg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMi1Hd1Upo8zV4MPtdqHgEaMQ72yK0gZgf5Z4uOaqKqhw8Hndg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/06/2023 11:17, Amit Pundir wrote:
> On Wed, 7 Jun 2023 at 13:19, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 07/06/2023 01:34, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Fri, Jun 2, 2023 at 9:12 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>
>>>> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
>>>> list to workaround a boot regression uncovered by the upstream
>>>> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
>>>> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
>>>>
>>>> Without this fix DB845c fail to boot at times because one of the
>>>> lvs1 or lvs2 regulators fail to turn ON in time.
>>>>
>>>> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
>>>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 24 +++++++++++-----------
>>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>>> index e14fe9bbb386..df2fde9063dc 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>>> @@ -301,6 +301,18 @@ regulators-0 {
>>>>                 vdd-l26-supply = <&vreg_s3a_1p35>;
>>>>                 vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
>>>>
>>>> +               vreg_lvs1a_1p8: lvs1 {
>>>> +                       regulator-min-microvolt = <1800000>;
>>>> +                       regulator-max-microvolt = <1800000>;
>>>> +                       regulator-always-on;
>>>> +               };
>>>> +
>>>> +               vreg_lvs2a_1p8: lvs2 {
>>>> +                       regulator-min-microvolt = <1800000>;
>>>> +                       regulator-max-microvolt = <1800000>;
>>>> +                       regulator-always-on;
>>>> +               };
>>>> +
>>>>                 vreg_s3a_1p35: smps3 {
>>>>                         regulator-min-microvolt = <1352000>;
>>>>                         regulator-max-microvolt = <1352000>;
>>>> @@ -381,18 +393,6 @@ vreg_l26a_1p2: ldo26 {
>>>>                         regulator-max-microvolt = <1200000>;
>>>>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>                 };
>>>> -
>>>> -               vreg_lvs1a_1p8: lvs1 {
>>>> -                       regulator-min-microvolt = <1800000>;
>>>> -                       regulator-max-microvolt = <1800000>;
>>>> -                       regulator-always-on;
>>>> -               };
>>>> -
>>>> -               vreg_lvs2a_1p8: lvs2 {
>>>> -                       regulator-min-microvolt = <1800000>;
>>>> -                       regulator-max-microvolt = <1800000>;
>>>> -                       regulator-always-on;
>>>> -               };
>>>
>>> This is a hack, but it at least feels less bad than reverting the
>>> async probe patch. I'll leave it to Bjorn to decide if he's OK with
>>> it. Personally, it feels like this would deserve a comment in the dts
>>> to document that these regulators need to be listed first.
>>>
>>> Ideally, we could still work towards a root cause. I added a few more
>>> ideas to help with root causing in reply to the original thread about
>>> this.
>>>
>>> https://lore.kernel.org/r/CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com/
>>
>> We do not shape DTS based on given OS behavior. AOSP needs this, BSD
>> needs that and Linux needs something else. Next time someone will move
>> these regulators down because on his system probing is from end of list,
>> not beginning and he has the same problem.
>>
>> No, really, are we going to reshuffle nodes because AOSP needs it?
> 
> Hi, other than the fact that I reproduced it on AOSP, there is nothing
> AOSP specific in this patch. I'm sure there may be another
> platforms/OS (which load kernel modules from a ramdisk) that may trip
> on this bug. But I can try reproducing it on an OS of your choice if
> it helps.

I wrote earlier imaginary system where RPM driver loads the regulators
from the end. It would require re-shuffling to previous order of the
nodes. Feel free to change the RPM drivers to simulate it and you should
see that your patch stops helping.

The problem looks like in missing consumers, missing probe dependencies
or something in the driver how it handles these.

DTS should not be used for solving OS related problems.

Best regards,
Krzysztof

