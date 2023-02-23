Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534A1FB5
	for <regressions@lists.linux.dev>; Thu, 23 Feb 2023 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677139504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+ueFbDYI2fCK6KAGkfWDv0qOw1/uXZTIg/vtWRlPiU=;
	b=adB+W9iy6u6cBXv593m+9LlnTmT1xtIdBo7KvGPFbhVpCBbEI/aULbM3KSljLIijQi3iqT
	cHizFw9MrpR1gjj5uHs/Sr7VT8YmU+KohhCvYlBEs33kb2poyRKmLw+Cw5xNl3j7Wgp4jY
	rhpLvBmZXQfoA/cNA2/LXm/tHYqSvLk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-hOAT_IWjOr-Q1o305JZO2A-1; Thu, 23 Feb 2023 03:05:03 -0500
X-MC-Unique: hOAT_IWjOr-Q1o305JZO2A-1
Received: by mail-wm1-f70.google.com with SMTP id e17-20020a05600c219100b003e21fa60ec1so4430017wme.2
        for <regressions@lists.linux.dev>; Thu, 23 Feb 2023 00:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+ueFbDYI2fCK6KAGkfWDv0qOw1/uXZTIg/vtWRlPiU=;
        b=bcn8/b4/cBVHhipQn9i77/V0yYkCeEDzuqN/pZqlA1TXCBuHr95RN6Y/cwrPSWZz1o
         RPNAVMcLvBivYxmr2Dk7ip56GZ+jxfO9aoFRf3DzMUmA2fwT1ydwD/t7VomhCN/LRpB2
         GWhEnvowLXf6r1/5oKU/lbO5HtvCU1HB3NSQ93yIvZS3svLo+G8W128rhf+b80hcXYju
         sTJFtKUapNMM/Zyjm758F0s6ut4qT+6jmJOnK3pjXCCPKKb2nVjJGW45z98NWoo2f/NS
         0T7za8EAWZBVvBVDxlX4FjaHvHK42greYR27lYhN4LXUa5YmqraU5YsukZMqZTAY0Ecc
         pp6w==
X-Gm-Message-State: AO0yUKV/1Iu7xjIcD853qlfrAXs4wGug9CSQYG+G+HOm98AYTihQcDIe
	5supsw6yQtLnXPB6fohAWyO6HNu1cTBffBjpntw4uzlBUn8VZLZIzX6viZTihyDwxxPYqnunD7N
	ehPMIKurtWlfovjnWeOFjIkE=
X-Received: by 2002:a05:600c:3093:b0:3dc:555c:dd30 with SMTP id g19-20020a05600c309300b003dc555cdd30mr1930920wmn.27.1677139502052;
        Thu, 23 Feb 2023 00:05:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8C2KkhdFOu+LnX9wVb8yRJ6czYkak4zwJwTlRC59nu1vtOB2+Qi4rT251F92cwGEsPeVo5bw==
X-Received: by 2002:a05:600c:3093:b0:3dc:555c:dd30 with SMTP id g19-20020a05600c309300b003dc555cdd30mr1930899wmn.27.1677139501762;
        Thu, 23 Feb 2023 00:05:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b003e1f2e43a1csm10728694wms.48.2023.02.23.00.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 00:05:01 -0800 (PST)
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
In-Reply-To: <DM8PR02MB8169E16569616870A583B376F3AB9@DM8PR02MB8169.namprd02.prod.outlook.com>
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
Date: Thu, 23 Feb 2023 09:05:00 +0100
Message-ID: <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Vikash Garodia <vgarodia@qti.qualcomm.com> writes:

Hello Vikash,

> Hi All,
>

[...]

>>
>>No reply from Mauro and Linus chose to not apply the revert I pointed him to.
>>That at this point leads to the question:
>>
>>Vikash, did you or somebody else make any progress to fix this properly?
>
> We tried with different settings for the registers and arrive at a conclusion that
> the original configuration was proper. There is no need to explicitly configure
> the secure non-pixel region when there is no support for the usecase. So, in summary,
> we are good to have the revert.
>

Perfect. Thanks a lot for looking at this.

> Stan, could you please help with the revert and a pull request having this revert
> alongwith other pending changes ?
>

Other fix posted is "media: venus: dec: Fix capture formats enumeration order":

https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

