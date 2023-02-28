Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA363C5
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677600227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
	b=OEvO2hjLOql8LTVrmgTfZaBhPf9c8HWQXGL6C7UmsYBg9nossJniRvcoJyQcjeo2eUGCX4
	vEycITcZCsTfTvUwLWyhRFDiUcGfP8CeOlBSqKxOYEARGUOsyU/xZQ5ouIiM/3emrWfDPe
	ecOwZw422p5mvdlMImBUtMH86ew6wyg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-Po99KAYTNN684wAaLu07eA-1; Tue, 28 Feb 2023 11:03:46 -0500
X-MC-Unique: Po99KAYTNN684wAaLu07eA-1
Received: by mail-wr1-f71.google.com with SMTP id g6-20020adfa486000000b002c55ef1ec94so1684342wrb.0
        for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 08:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677600224;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
        b=nqkrSjfFij3HbWo0wXHQoyunregaAO5yu9d1/u6Pb3VXcwOYi9780zCCWc/AG93Gws
         naOSp7Df8xk4WCHlclKG37AwTrrJLI26VknjmR5f7qfjZNoplDxw+ed2GqOX6wBWcyOj
         qFXhVbgMlk95BUVHaQRsWc8RPID3NNDehw/Ez77MHHTRTjkaNhqr1KoTaxs6ZsrViByw
         qMBBwRvQDkop6jdmBUz2mCRpCiLv4It+aTkYLLPKFa5nR75DqyXLmAH88kLSLWhwDbK5
         o41tzEGfLWu4FrxDN4ZlaCRMUX0LW8efJiJ9gNP0kwQ1asclCywU/7V6UEuYPT3583pL
         AUvw==
X-Gm-Message-State: AO0yUKUwt4trnijQGH2IbXohb3wteg6xvCIORq82G72droZXVF4VogXq
	UIcXo0oglSwqkwQfxuSRp2yO8ph53aybAgCnn978BGf/rDwWj3Z/t2OlB3bz7N/UCWCO/M0ss4C
	udzvb/bCJDQqDgpiwz1BpV6g=
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573794wrx.48.1677600224600;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9v0g4E7whTc7rYOu89mROUSRxzGr6QXBdhfOQaLBzNnR8lC5RcL1m+NJS3PUR1LZvjFt2e1g==
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573757wrx.48.1677600224266;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm16485490wmi.10.2023.02.28.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:03:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Vikash Garodia <vgarodia@qti.qualcomm.com>, Linux regressions mailing
 list <regressions@lists.linux.dev>, Stanimir
 Varbanov <stanimir.k.varbanov@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mka@chromium.org" <mka@chromium.org>, Albert Esteve <aesteve@redhat.com>,
 "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>, Enric
 Balletbo
 i Serra <eballetb@redhat.com>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Fritz Koenig
 <frkoenig@google.com>, "Dikshita Agarwal (QUIC)"
 <quic_dikshita@quicinc.com>, "Rajeshwar Kurapaty (QUIC)"
 <quic_rkurapat@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
In-Reply-To: <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
 <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com>
 <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
 <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
 <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
 <9a0bfef8-0b5d-f4d0-a8a5-4bbcacc5c0fb@leemhuis.info>
 <DM8PR02MB8169E16569616870A583B376F3AB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 28 Feb 2023 17:03:43 +0100
Message-ID: <87edq9hj4w.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Vikash Garodia <vgarodia@qti.qualcomm.com> writes:
>
> Hello Vikash,
>
>> Hi All,
>>
>
> [...]
>
>>>
>>>No reply from Mauro and Linus chose to not apply the revert I pointed him to.
>>>That at this point leads to the question:
>>>
>>>Vikash, did you or somebody else make any progress to fix this properly?
>>
>> We tried with different settings for the registers and arrive at a conclusion that
>> the original configuration was proper. There is no need to explicitly configure
>> the secure non-pixel region when there is no support for the usecase. So, in summary,
>> we are good to have the revert.
>>
>
> Perfect. Thanks a lot for looking at this.
>
>> Stan, could you please help with the revert and a pull request having this revert
>> alongwith other pending changes ?
>>
>
> Other fix posted is "media: venus: dec: Fix capture formats enumeration order":
>
> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/
>

Vikash,

Could you or someone else from QC please Review/Ack these two patches,
since it seems that Stanimir moved on and maybe is not working in this
driver anymore?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

