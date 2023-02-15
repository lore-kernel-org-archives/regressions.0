Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3277C
	for <regressions@lists.linux.dev>; Wed, 15 Feb 2023 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676458674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MmeJjSh427GKtr5aY1dE1/UGw/jLjAjyH6qeK2RMoAo=;
	b=dLdgrIexzItBGKrwP+yRmGg7nlc/pOLzkks2orbuVBSrBO8OXhu8GjryuCV/VvwXuJoPR3
	YLJ2RLfYiVP1un/Uk2Gu+xx4GYRseU4IrxizhB7wMeHd3UTl46sQUagYM797Sogc2zhcXs
	zk9vhSwcGhKVPuhW+rWfwzdwFWOuRIc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-jBP7hm8xP8qvmGhfbh-LfQ-1; Wed, 15 Feb 2023 05:57:51 -0500
X-MC-Unique: jBP7hm8xP8qvmGhfbh-LfQ-1
Received: by mail-ej1-f69.google.com with SMTP id ud13-20020a170907c60d00b0088d773d11d6so11941977ejc.17
        for <regressions@lists.linux.dev>; Wed, 15 Feb 2023 02:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmeJjSh427GKtr5aY1dE1/UGw/jLjAjyH6qeK2RMoAo=;
        b=7rRFHepmyuzFVVaoyxCENjpfHUGcx9cyKrzdxQdXPKCMi22R3XclS7JcliB0WwO8nK
         SdVSCul64BElPTHuJWoVCve24u2Fy+p0c6dAmEaOWGqwMiOX6zLabaTVtEQk33iFH6tA
         gx6e6OU6rr2piZ6GDAddcsyT7+55vgNGt0K61hwAPTgfjE4370d+4nFSdpVJ28Fb7ieE
         wMVzozqdV1HaD3tvRBEIRAu5Os+eGwMjbZiUNbFfmooExtkJGy837cF2uJ+9vc2i6Hfo
         sbALkmg0OOnvO/2jNylOz5NShths0pVDCDMcLm5b1lm8eSwBkmpZNgCUQF3ORVcxOTRa
         m9ZQ==
X-Gm-Message-State: AO0yUKVWaot+7yBsgVeGgauJbUHK5/1N5vzdsr/4ZI+LBnF/iJTNTU1y
	/cnlGd4gmJlR2XyKowwVDJGgTmPtJArnANMWJtQRjxWv48XsGvyC18sj5365KHjYLhWFDgu1dej
	gTv3DOVZK30sEOxjUn7rIc+hHnO15EdJfpJuBRn9oegaC
X-Received: by 2002:a50:ccc2:0:b0:4ac:bebb:e5fe with SMTP id b2-20020a50ccc2000000b004acbebbe5femr831733edj.1.1676458669786;
        Wed, 15 Feb 2023 02:57:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+nxXB+Yb8YV5YVO81VjVBf4VZDL30eASGa9yuof5vxNU99jL1I3nSh0NSHMQMi9N7zea0BuUiOR9pDqaaa2nw=
X-Received: by 2002:a50:ccc2:0:b0:4ac:bebb:e5fe with SMTP id
 b2-20020a50ccc2000000b004acbebbe5femr831725edj.1.1676458669643; Wed, 15 Feb
 2023 02:57:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230207102254.1446461-1-javierm@redhat.com> <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com> <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com> <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
In-Reply-To: <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 15 Feb 2023 11:57:38 +0100
Message-ID: <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end addresses"
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Vikash Garodia <vgarodia@qti.qualcomm.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	Albert Esteve <aesteve@redhat.com>, 
	"stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>, Enric Balletbo i Serra <eballetb@redhat.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Fritz Koenig <frkoenig@google.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 11:53 AM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 11.02.23 15:27, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 10.02.23 11:07, Javier Martinez Canillas wrote:
> >> On 2/10/23 10:22, Vikash Garodia wrote:
> >>
> >>>> So what should we do about this folks? Since not allowing the driver to probe on
> >>>> at least SC7180 is a quite serious regression, can we revert for now until a proper
> >>>> fix is figured out?
> >>>
> >>> I am able to repro this issue on sc7180 and discussing with firmware team on the cause
> >>> of reset failure. The original patch was raised for fixing rare SMMU faults during warm
> >>> boot of video hardware. Hence looking to understand the regressing part before we
> >>> proceed to revert.
> >>
> >> Great, if you are working on a proper fix then that would be much better indeed.
> >
> > Yeah, that's great, but OTOH: there is almost certainly just one week
> > before 6.2 will be released. Ideally this should be fixed by then.
> > Vikash, do you think that's in the cards? If not: why not revert this
> > now to make sure 6.2 works fine?
>
> Hmm, no reply. And we meanwhile have Wednesday and 6.2 is almost
> certainly going to be out on Sunday. And the problem was called "a quite
> serious regression" above. So why not quickly fix this with the revert,
> as proposed earlier?
>
> Vikash? Javier?
>

I agree with you, that we should land this revert and then properly
fix the page fault issue in v6.3.

But it's not my call, the v4l2/media folks have to decide that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

