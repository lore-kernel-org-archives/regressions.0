Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF51FC1
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 03:28:32 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u19so16908004ejm.8
        for <regressions@lists.linux.dev>; Sun, 08 Jan 2023 19:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoNSLMosHAarytATuIdRvcxNL2oMrGcNMkG2OXCiBm0=;
        b=OhAzq0ON3BtWr9Vy6mGpHdzLedc/jcdcZ1x7J19FpyDnX+MU7lN3J43I3/RGTodGGC
         caAswwh1Bkc198Lk4ApR6Us8T1RFdd15iarFZTsEnHV6mb9p/OV5fjus7ebigVkHPfke
         YLsdFsWDsiI5oMyqZyF+2S4iiSZ/GAEPY1ECXTaq7+baWT34Gkg4LSSYzkVfBMFkyWwd
         5OhNa8YGgTek+zCCj0cMAsIEoPJF4JjGX4J6nPqhgUyR4XD/3di0DhxkeKRJpvtiKOlS
         SA4doQIlTCIs7FQ4f++SD8f0KQ1zYwInadmuOZeBfmQjCGw+W/YzTXBw5sLxXS42Ch6M
         Djeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoNSLMosHAarytATuIdRvcxNL2oMrGcNMkG2OXCiBm0=;
        b=uFuAc83AWgKfP9MCiqNV8esWQ7L543vwtrjfweppNYfp6euVOrebb7RXfPt4qtsaK3
         W33fzvvssU5bnoke7HM2B0zjwnVyi9Gr4IxNSRmiI+Bj2E01ys6h9TXfv5AhTU4M3oys
         i8ifRZ3wCxKTUgo6po+X4J7l4xFlk+S92e2mCgq78jrZ8rLAT59g0qRLsEt+merAcRQ2
         h0EabAE1Wwx8HeeO7JFZo5cQyALu3aWw/ezkqDzF5aQx3CIz+W+ls8tddj3GnWJ+wZlU
         fSVHZuCSR+XEW9gZnykysaYYrgO/g2JwZGMG3QDxIsTehKi0zEBO09GAjNIXMauFmc+I
         EXJQ==
X-Gm-Message-State: AFqh2kpbwwYsNOMbAUwUg+6oFHLmYhruXxWOeAFWdcrq7WdL8FETSFDl
	AP4wCy1uopooldmjp/M5mV0hGs9KQL8DRGjsaoYzrA9/spY=
X-Google-Smtp-Source: AMrXdXsrq2GQ0RBe0oyU2WDPUba26sV+N6A+2kOdCfWDQQtHhYgXP+DCSkx1JZG7tpA7KULhBoXnJcgI8I2yDt5NCds=
X-Received: by 2002:a17:906:7fc3:b0:81d:3231:591f with SMTP id
 r3-20020a1709067fc300b0081d3231591fmr4565331ejs.46.1673234910701; Sun, 08 Jan
 2023 19:28:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN_LGv2FLLKxsbruJ0u_Gh3+_nTGaVGd4154DXQ7Tz+BnFt3EQ@mail.gmail.com>
 <ac023262-c6cb-01ad-aeee-2dbf379f4c37@leemhuis.info>
In-Reply-To: <ac023262-c6cb-01ad-aeee-2dbf379f4c37@leemhuis.info>
From: "Alexander E. Patrakov" <patrakov@gmail.com>
Date: Mon, 9 Jan 2023 11:27:54 +0800
Message-ID: <CAN_LGv0gqd1VpWgD0vdVuPZGhZ_R8pdNQntSJ9_602ym_ofeog@mail.gmail.com>
Subject: Re: Commit b320d6c4 broke mt76
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Benjamin Berg <benjamin.berg@intel.com>, Johannes Berg <johannes.berg@intel.com>, 
	Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 04:58, Linux kernel=
 regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info>:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 08.01.23 20:46, Alexander E. Patrakov wrote:
> > Hello Benjamin,
> >
> > I have this hardware, which is supported by the mt76x2e driver:
> >
> > 04:00.0 Network controller [0280]: MEDIATEK Corp. MT7612E 802.11acbgn
> > PCI Express Wireless Network Adapter [14c3:7612]
> >
> > Since Linux 6.1, the mt76 driver panics the kernel due to null
> > dereference shortly after authenticating to the AP, as follows:

<snip>

> > b320d6c456ff2aa43491654407d448bcfa58ac9f is the first bad commit
> > commit b320d6c456ff2aa43491654407d448bcfa58ac9f
> > Author: Benjamin Berg <benjamin.berg@intel.com>
> > Date:   Fri Sep 2 16:12:40 2022 +0200
>
> Not my area of expertise, but I guess it's fixed by this patch:
>
> https://lore.kernel.org/all/20221230200747.19040-1-nbd@nbd.name/

That patch indeed fixes the problem. Thanks!

--=20
Alexander E. Patrakov
