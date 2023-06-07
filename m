Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497F6AAE
	for <regressions@lists.linux.dev>; Wed,  7 Jun 2023 07:46:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5169f614977so398643a12.3
        for <regressions@lists.linux.dev>; Wed, 07 Jun 2023 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123989; x=1688715989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqsEzFqUgOVZQzpckmPA7QYky+nCMGAOocJxXSgiBwk=;
        b=aVQBd/L+gFSHbciCPHrq2Jw+Vdc0fz+VuiYH0t5mtgbnZI+CylhNF1IjYCJF7K+fDk
         jays2/s44/Bun2QJli+RcJFBc4xVh0K9d5v3xnRfstXG+bdxVGRbHBAWbu7W1CbIOcOX
         8jGRt80BhzbAkkB4UZDICNmVGFQ+Y3CEAbmpNCQ3l2qPTp5HkJ99qerTDFs8UcPMCK1G
         gIWzKvNkRGPmrP0BZhNiii/ZwHk5Hb16oBMFQNCOhzhU8DgSLrd094MkgAVMbfTF0gsx
         CRpJDv1a7Z0om7jAXcHwsmK9DGvPzN2YR6iXlcD5babDT9RtLrTt7LcuBvAqNlqPzaF6
         QyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123989; x=1688715989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqsEzFqUgOVZQzpckmPA7QYky+nCMGAOocJxXSgiBwk=;
        b=aRAy2xTqdyn91Zzf63dChlp7T1Z4fkFtEXQIC/t/VLDCRiulFjs7IEs6BBX5BO/TaK
         /ZCIki6BmzWPs8kmFBr3W1rL9HCP0AWdiboeXkOg5/doVrqK6FnFAdZ8nAUlJ7aHr1Eq
         bFRlWpczP6cC+HzhSM+KFym+M+/HPjGT2OwFO3uzxHINaUdePc7X913ZTCogEackzDVJ
         nm1Sgg2LFVKx2xyUyw1bQmWsCq75lpr3Fmpdc7au8YzEpAK6p8+ctRN3HF22GkAcaPKw
         5KeILhEYXtYJXcn6G4XizAzDO3VcFWmmV9cYsszI+Gx6p7pK5uYxNwD4owQAz7lPBmya
         q82w==
X-Gm-Message-State: AC+VfDwGSNAv3Ek4GjEmM+0VIesM4UzDvFUskGEEZ4XhKbCyuhsb2j3B
	bL+r64AAW2e3OnJjYtpJ33n4TA==
X-Google-Smtp-Source: ACHHUZ4kcZo5MjWf9lYD7Xmfamt0m6nLHk5TvmssVtzCrdVn0j5JqN0jhvh5zR8i+TWc79PPFEQtjQ==
X-Received: by 2002:a17:907:9403:b0:96a:ff7f:692 with SMTP id dk3-20020a170907940300b0096aff7f0692mr4186582ejc.68.1686123989313;
        Wed, 07 Jun 2023 00:46:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i15-20020a170906a28f00b00968242f8c37sm6479031ejz.50.2023.06.07.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:46:28 -0700 (PDT)
Message-ID: <407ace5b-5c63-a6de-ff41-24d5cd1d4eb8@linaro.org>
Date: Wed, 7 Jun 2023 09:46:27 +0200
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
To: Amit Pundir <amit.pundir@linaro.org>, Mark Brown <broonie@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: regressions <regressions@lists.linux.dev>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602161246.1855448-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2023 18:12, Amit Pundir wrote:
> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> list to workaround a boot regression uncovered by the upstream
> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
> 
> Without this fix DB845c fail to boot at times because one of the
> lvs1 or lvs2 regulators fail to turn ON in time.

Why regulator would fail to turn on time? If it has ramp-up delay, add
it to DT. Otherwise how is it possible? You have a consumer, right?

This is not the correct solution and it is hiding real issue.

Best regards,
Krzysztof

