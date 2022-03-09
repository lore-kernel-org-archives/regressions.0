Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD175127
	for <regressions@lists.linux.dev>; Wed,  9 Mar 2022 22:18:43 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id o6so5233784ljp.3
        for <regressions@lists.linux.dev>; Wed, 09 Mar 2022 14:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWHcqmg8Jl/pDjYFxNFIoMx9za7BtcKb+LqL6quSfGc=;
        b=JBSeZQVR2uJx6lhn0r/r5EYbLrVfz00Zsw3BXJynWJrUWxBjyZLMQRRqUzwINB6Asl
         IhP8O5f3AGqqa+4bVe3ZJRj4DkJriEYCPudUq4j5tF7ZnRXpA28Jio1P65LhtHRzISKp
         eUqgCoBPcZ3vxbqqZWdY88AkKNxFYF/4E1mLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWHcqmg8Jl/pDjYFxNFIoMx9za7BtcKb+LqL6quSfGc=;
        b=3ylWzZHjtlexXJOZJNE/OsckvVePWR3Jjx5CQNANXdY7I84Cg/Ey09gstVaZqFqPJj
         ujw9WbX0+1VlHqcL/F/GvrwsDrhLJFGZo+OoG+LCZYRFIYaEd85jdzin2kDsOAiW2PJp
         F2OxsYPDTmnApphXy/A05HjV48vWgL8boW21dp/stgD4MK9dAmICIEmpGWOOZDhOYiq9
         havA0UkYL+oSND4psSi3t47uhsDToNTtBxqdblvAbQCLbXlNo2tQH6eZQdU+ExSZfNl9
         2y+7gQa47g063nRDynbBAjaMq1uUrzjwsRV4LCXfmg4HN+NOLS/9zvX4aAfIDaBYLmXu
         WChg==
X-Gm-Message-State: AOAM533U2dk3IR2LjOO6BroxVwZbtyfL5/wUGTsZpeiEA/JoJwkesuXC
	4Gk9sfzao8TmjdSK68hsxf3AkHdpDb8wIuRGcPg=
X-Google-Smtp-Source: ABdhPJxgNI0uBvjQTwy28MWMuZfVmSq9BKgtPME0CxWL9aPTok8Wuv4RHYQ2rBvWh6NbgRvtshuWFw==
X-Received: by 2002:a05:651c:b12:b0:247:e2b0:5495 with SMTP id b18-20020a05651c0b1200b00247e2b05495mr1065150ljr.433.1646864321652;
        Wed, 09 Mar 2022 14:18:41 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id k8-20020a2eb748000000b00244badbe7c9sm644783ljo.60.2022.03.09.14.18.39
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 14:18:39 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id r7so6260496lfc.4
        for <regressions@lists.linux.dev>; Wed, 09 Mar 2022 14:18:39 -0800 (PST)
X-Received: by 2002:a05:6512:e8a:b0:443:7b8c:579a with SMTP id
 bi10-20020a0565120e8a00b004437b8c579amr1080661lfb.687.1646864319396; Wed, 09
 Mar 2022 14:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217165552.746-1-manishc@marvell.com> <ea05bcab-fe72-4bc2-3337-460888b2c44e@molgen.mpg.de>
 <BY3PR18MB46129282EBA1F699583134A4AB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
 <e884cf16-3f98-e9a7-ce96-9028592246cc@molgen.mpg.de> <BY3PR18MB4612BC158A048053BAC7A30EAB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
 <CAHk-=wjN22EeVLviARu=amf1+422U2iswCC6cz7cN8h+S9=-Jg@mail.gmail.com> <BY3PR18MB4612C2FFE05879E30BAD91D7AB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB4612C2FFE05879E30BAD91D7AB0A9@BY3PR18MB4612.namprd18.prod.outlook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Mar 2022 14:18:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXCf43ieh79fujcF=u3Ow1byRvWp+Lt5+v3vumA+V0yA@mail.gmail.com>
Message-ID: <CAHk-=whXCf43ieh79fujcF=u3Ow1byRvWp+Lt5+v3vumA+V0yA@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 net-next 1/2] bnx2x: Utilize firmware 7.13.21.0
To: Manish Chopra <manishc@marvell.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "kuba@kernel.org" <kuba@kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Ariel Elior <aelior@marvell.com>, 
	Alok Prasad <palok@marvell.com>, Prabhakar Kushwaha <pkushwaha@marvell.com>, 
	"David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"it+netdev@molgen.mpg.de" <it+netdev@molgen.mpg.de>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 11:46 AM Manish Chopra <manishc@marvell.com> wrote:
>
> This has not changed anything functionally from driver/device perspective, FW is still being loaded only when device is opened.
> bnx2x_init_firmware() [I guess, perhaps the name is misleading] just request_firmware() to prepare the metadata to be used when device will be opened.

So how do you explain the report by Paul Menzel that things used to
work and no longer work now?

You can't do request_firmware() early. When you actually then push the
firmware to the device is immaterial - but request_firmware() has to
be done after the system is up and running.

                 Linus
