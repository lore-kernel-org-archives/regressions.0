Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEEF10973
	for <regressions@lists.linux.dev>; Thu,  8 Jun 2023 17:44:24 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77703f20aa9so43843939f.1
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686246262; x=1688838262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioc3PMTHThn4DBw80/q6Z7SBMJ2IWtRiI0d7gZlh7mA=;
        b=fhjjpFrYBaSCiNzx+CCbfycrWH7Q/2xWrhYMoQfydKCDMDkLHRjsNDBreC+z/uueiE
         yVpq+0KkEJQzU9zA3tQB8+ojpnhQb6wXCkzyDekvGMplzbCY8x5eVWvedZSF0smKbz26
         cxICGvPT/p6bs/Hcno6+D84SVIPadUwiQ+Mx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686246262; x=1688838262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioc3PMTHThn4DBw80/q6Z7SBMJ2IWtRiI0d7gZlh7mA=;
        b=KVFHg/Ec1DU1B7pboHhQtiSMTo+hv1eAprGkCQqINWFJ+pWMMbMeipv23JdJInWOU0
         tdP6rzA0sGgDoD1QgVWOKd8UF8ydDaJQCwGYsUn5QTNACfY0pBDMYaLkp2/GQy2nay0D
         5UP1lA3y76J/ovWZzg4KD5RBzVzj3kRd9tK1pGFcOneDWHCOg2L9cgRtz3qGpMzF/9XM
         PlO6/2r2dSSBC5WvQcdK4rt+8RUr2Wm1Ov09xzbeMWrkFp3BBNFElMa+mdZetlP/kXvN
         9RVNwduVUBNR543+pqpm0h+9CHmz7i7UlpWKtg+GiYcKP/lKbRI1Kh9LLgDTpjPggS7s
         jMfw==
X-Gm-Message-State: AC+VfDyVvNtRPxZT4Bpy14JdmBEb8fMoX+mPzg6BXiwf1LY/8aKCPSe6
	C8gBlotNKNyN5KC2Q+inSPBJcpdnCoRo+SKh3kw=
X-Google-Smtp-Source: ACHHUZ4+yv2gEkXmrnj/SLRL86LwFehLxq42jKBoI2jdIAoJ09Hi8q50hB4CiRaQRhXyjA4d9DLQrA==
X-Received: by 2002:a05:6e02:544:b0:33d:5c7a:25b7 with SMTP id i4-20020a056e02054400b0033d5c7a25b7mr11079952ils.0.1686246262262;
        Thu, 08 Jun 2023 10:44:22 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id u3-20020a02cb83000000b00408c8da83ffsm398644jap.127.2023.06.08.10.44.19
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 10:44:20 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33d928a268eso151655ab.0
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 10:44:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a0c:b0:328:3a25:4f2e with SMTP id
 s12-20020a056e021a0c00b003283a254f2emr153033ild.9.1686246258975; Thu, 08 Jun
 2023 10:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
 <d0dfdfba-7a70-7d12-2c30-ad32b3f95bb8@linaro.org> <CAMi1Hd1Upo8zV4MPtdqHgEaMQ72yK0gZgf5Z4uOaqKqhw8Hndg@mail.gmail.com>
 <55f07600-3fa5-f3c2-eb3e-e87a57244812@linaro.org> <CAMi1Hd0qRrRw3_U7kqz-8BJnwJR1RqweajBWrZWWDGmtqVMDAQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd0qRrRw3_U7kqz-8BJnwJR1RqweajBWrZWWDGmtqVMDAQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 10:44:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+SMsr=TCJtbimq0U94gcoucMLSwA6adCKwn3y+qxLZA@mail.gmail.com>
Message-ID: <CAD=FV=W+SMsr=TCJtbimq0U94gcoucMLSwA6adCKwn3y+qxLZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	regressions <regressions@lists.linux.dev>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 8, 2023 at 10:27=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> On Wed, 7 Jun 2023 at 15:46, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> >
> > The problem looks like in missing consumers, missing probe dependencies
> > or something in the driver how it handles these.
>
> Missing consumers seem to be the case here, if I'm reading the
> $debugfs/regulator/regulator_summary correctly(?)
> https://www.irccloud.com/pastebin/raw/2jwn0EQw.
> lvs1 and lvs2 sysfs entries in /sys/class/regulator/ do not list any
> consumers explicitly either.

They are marked as always-on regulators, though. The lack of an
explicit consumer in device tree shouldn't really matter. I don't
think this is the source of your problem.

-Doug
