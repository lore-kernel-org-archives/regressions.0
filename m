Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654D1B5EB5
	for <regressions@lists.linux.dev>; Fri,  6 Dec 2024 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733519925; cv=none; b=PDXm+u9zD5GUVo51FtnWBh2a1xP7DzD5bGhPiFiFJdRLkPF4aAJG+y9DvQS75/NNJ0uKU3KQaJxl8NJVcpJ2It4WMeuUOR0TD4A0sZ6BgkVA9HCEWyRuxS+OGu2GWPKeNFMIqcyh3lly8F23CcO8DATMbjWbPIBKr7RcJoP9vSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733519925; c=relaxed/simple;
	bh=+G0VUTcrCnTC5rX+UjcLwTptgU7q/HBq1U1Y2xggPl4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PROitza5Vzbx4YRRJZOg+RxzMogEmeCuJrWTFi9b234ve58Bh1smdp8wlP0YcSgfTCpBlcajfM/Y831eW4rZVkmn2inkkh1xyk+vNLw3CpCql1qRBS0ZIrzRok4ad29tfas4zsf57gPRlAwkJx+KOLkyJLELF2r/CxFtJHfsFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne+B9wrk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne+B9wrk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso312517066b.1
        for <regressions@lists.linux.dev>; Fri, 06 Dec 2024 13:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733519920; x=1734124720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G0VUTcrCnTC5rX+UjcLwTptgU7q/HBq1U1Y2xggPl4=;
        b=ne+B9wrkgsYfcawsl/Yha+EIxSRx3c6V87WEhRIvDNDusBYNP70UxIRJ4CFkz6GVbv
         Kx/uFkPxrJOscHZrNkrIiOgNgRySji0BappBewaOQodjA/8ZukI/XyFjajPCn9bAuXC3
         f5fcW1VxSFwBeSx9eW3GIQ0cL7JhnSWE6Jdnrb13kshATvikpg1eca9NHCg++HVvReYH
         fQk3aM3NwmhvG/WkWw2n9btkG5rFGihww8gSKzo8d+K3rfQDgJ3DtEhnHXa45DqyKtj7
         PQFI4HbOFYjm6qeg4KUM8do32osAdibr2iGwSErqVtKszTnWGH1GDHXAD9zFgZvZ86OF
         +YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733519920; x=1734124720;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+G0VUTcrCnTC5rX+UjcLwTptgU7q/HBq1U1Y2xggPl4=;
        b=GqBZHguwwiPcrCxEckG+pktDaQP2RFTuCCYUdz3d+/jd+CgbrFCnf2TVJixkozzCDk
         Vob7OA/P1iZI4Oxzcka8HptjGcOrpt0ZgoEMahKlTb+vzC6iZu6Iaje9ZMnZ2Aa5wgM3
         kKL17S1NDoim4k+RY9SaZRrFZZmOw+9LrmTDR30MtAZ9/qekeLTJ938I4FBTRyRcid1J
         s/XA69uzn+wLbJOZ8xfi1lASoXEJgWgEzXQ218eqDjEvvT82WuQn/Ar9XSf9wUSm96QZ
         TqHoHKdAH/VEQkx3DMjSbSzA7GyThT7v7Ssx6Agl3IIIiGY6RVnRvtVNtTFU4HbCV8kx
         Tf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSgp2co3NF3e8UahOOajldjW7kz1wZ7XMr57rUX/6Q2itMhAa5plXaSKsVD4Qx+cnrrDS5yzsHpRsADg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3dzjyHfBDi3vS9cjVfoMo9wB9LKV7ox4Ls/yxXcOsRfe/hcF6
	WVMKPggackokrDesk1VgemIUqRSXWN6lQT0fH9LfC9wY75yq/aLdqZy/h4TG
X-Gm-Gg: ASbGncvWcfwZO4IE5MRMe92UJMkzmBvsU7Qal4+9l27wD1vbXPq6K8U+n//B8G//lDP
	sunwmfXhac6LaNx67HzgMVhy9s6NO4Hnt8Cc+5kD9PCsq3DdBOvtL4wPebNAM4FY/MKMGsLmotj
	1X8DrQ6T04RW6qtlXqMxDzhDb2lLUm/SHMK2FBPo1lNLsqkqPBLOGgXtsV+uKjQ1gwETdNeG1Vu
	lh1SsdFAQJG1HxnkyZcJB7dHHUhDEAI8L3xS01Dpk6lZw==
X-Google-Smtp-Source: AGHT+IGcoxybZrhqT6jfLtgMG6i7/mc41GHYgMF8CO/3DtZQeH/elgJdfj7dasDNeMyogMXK8EXInA==
X-Received: by 2002:a17:907:7714:b0:aa6:3418:d9d4 with SMTP id a640c23a62f3a-aa63a073aa6mr302410166b.17.1733519919441;
        Fri, 06 Dec 2024 13:18:39 -0800 (PST)
Received: from [127.0.0.1] ([45.152.72.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96a3esm291696566b.59.2024.12.06.13.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 13:18:39 -0800 (PST)
Date: Fri, 6 Dec 2024 23:18:36 +0200 (GMT+02:00)
From: Yurii Strilets <yurastr100@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <78eb0efb-bbaf-4cba-840a-9aa507798075@gmail.com>
In-Reply-To: <bf3b9efd-6700-485a-bd0e-f81de1e11fcf@gmx.de>
References: <33bfcda8-3d3d-46b9-84f0-44e0e9f44230@gmail.com> <bf3b9efd-6700-485a-bd0e-f81de1e11fcf@gmx.de>
Subject: Re: [REGRESSION][BISECTED] asus-wmi driver fails on my laptop
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <78eb0efb-bbaf-4cba-840a-9aa507798075@gmail.com>

Thank you very much for the fix!
I am terribly sorry about a faulty report, I did just find out I had an iss=
ue during the mainline build.

Dec 6, 2024 20:15:05 Armin Wolf <W_Armin@gmx.de>:

> Am 06.12.24 um 14:33 schrieb Yura Strilets:
>=20
>> Hello,
>>=20
>> After upgrading from 6.11 to 6.12 a bunch of Fn+Fx buttons(touchpad,
>> mic, kb backlight, my asus) stopped working and the
>> /sys/(...)/asus::kbd_backlight interface is missing, which,
>> considering the dmesg, looks like an asus-wmi driver issue.
>>=20
>> I've been able to bisect the issue to the commit
>> [b012170fed282151f7ba8988a347670c299f5ab3] "platform/x86: asus-wmi:
>> Fix thermal profile initialization"
>>=20
>> Additionally, here's some maybe-helpful information:
>> my laptop's model -- ASUS Zenbook UX3402VA
>> linux distro -- Arch Linux
>> .config for bisection -- was taken from /proc/config.gz at 6.12.1 arch
>> kernel(attached in [1]) and missing options are default
>> dmesg logs -- The "grep asus" parts of both good and bad scenarios can
>> be seen below and full logs are at [2] and [3]
>>=20
>> =3D=3D bad.log =3D=3D
>> [=C2=A0=C2=A0=C2=A0 3.664546] asus_wmi: ASUS WMI generic driver loaded
>> [=C2=A0=C2=A0=C2=A0 3.713358] asus_wmi: Initialization: 0x1
>> [=C2=A0=C2=A0=C2=A0 3.714126] asus_wmi: SFUN value: 0x21
>> [=C2=A0=C2=A0=C2=A0 3.714131] asus-nb-wmi asus-nb-wmi: Detected ATK, not=
 ASUSWMI, use
>> DSTS
>> [=C2=A0=C2=A0=C2=A0 3.757420] asus_wmi: Failed to set throttle thermal p=
olicy
>> (retval): 0x0
>> [=C2=A0=C2=A0=C2=A0 3.757425] asus_wmi: Failed to set default thermal pr=
ofile
>> [=C2=A0=C2=A0=C2=A0 3.757429] asus-nb-wmi asus-nb-wmi: probe with driver=
 asus-nb-wmi
>> failed with error -5
>> =3D=3D end =3D=3D
>>=20
>> =3D=3D good.log =3D=3D
>> [=C2=A0=C2=A0=C2=A0 4.557898] asus_wmi: ASUS WMI generic driver loaded
>> [=C2=A0=C2=A0=C2=A0 4.776587] asus_wmi: Initialization: 0x1
>> [=C2=A0=C2=A0=C2=A0 4.777253] asus_wmi: SFUN value: 0x21
>> [=C2=A0=C2=A0=C2=A0 4.777256] asus-nb-wmi asus-nb-wmi: Detected ATK, not=
 ASUSWMI, use
>> DSTS
>> [=C2=A0=C2=A0=C2=A0 4.777258] asus-nb-wmi asus-nb-wmi: Detected ATK, ena=
ble event queue
>> [=C2=A0=C2=A0=C2=A0 4.805497] input: Asus WMI hotkeys as
>> /devices/platform/asus-nb-wmi/input/input15
>> =3D=3D end =3D=3D
>>=20
>> [1] .config - https://pastebin.com/raw/3nDSV8Sm
>> [2] bad.log - https://pastebin.com/raw/fvR5Sjzt
>> [3] good.log - https://pastebin.com/raw/EazfLAWA
>>=20
>> Thanks,
>> Yurii
>>=20
> I am aware of this issue, the necessary fix (commit 25fb5f47f34d) was alr=
eady submitted upstream and will likely
> show up in the stable kernels soon.
>=20
> Thanks,
> Armin Wolf
