Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B2481D1
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709565168; cv=none; b=gTNXOv1LzvhnPWF3KJUHK7hAyGB1lTf8p/+RN/7pccp691JihvP+nInKXJzoaAzEji3fI5uQuUMY8gb6KM/OhZ0Y6u9+cfpwQhFamMzsmKZgi0IV0U+81UjRM5zOdvHKEri4JEBFA3g2a9fxwEUsGpXQqAqe0K4Dg2GFl/HPoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709565168; c=relaxed/simple;
	bh=ANeFn0Vl19JA8TowDhr8E9cVOSbKmBckjJC7ISr9KYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fStUg4UJL0Ky2g/qGVIZkeehRz26KGiw05iU8pg4fuK8J2nrzr8n50rFxfsTBlB3lNr1JUXyo8CBntFq8yNR7iH7vaU+7Tuus3JgOxCq6pwkXdUWtPreqHMj+eg3wO8iaUvPlob6d8gUTadXRtAlD32vOlZTHH+bQrxBqVAG2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org; spf=pass smtp.mailfrom=khvoinitsky.org; dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b=ivalrMd1; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khvoinitsky.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b="ivalrMd1"
X-Gm-Message-State: AOJu0YywvRAZVs12t+nTVtZgNioXGtdia5wxyLFO10XBsoJcK2TYGWb9
	vdmwVZG5MD/8kHgG0YVMxRWBZG/qx5+L6N503FloiywqEodB/HONNE/l0zTFdUdLh7B9wB1gn1U
	Nl4AXqhlMZcliIUzgOU6lXOousgs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=khvoinitsky.org;
	s=key1; t=1709565164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANeFn0Vl19JA8TowDhr8E9cVOSbKmBckjJC7ISr9KYc=;
	b=ivalrMd1BBqiIIdghJtxs9m4MaM4OLWJT3llH6hD7KBtvTqh4Zt6ekv5rF0x50w3+NcxdP
	bUOwZ8JqLlWTvYeTclMcEZUA/QQstyzuS/eZH8mx0s1z0nixBBh1VuMOOQZ+Pd4Fm7AWEr
	b+eehcM918Fb2cJ3XSL05rJeCsXMYGU=
X-Google-Smtp-Source: AGHT+IFZiTc6XQ3gEJ5lwVog5csOwbE54OhnpzQYOO/02vEVnkVNrSEs9bBKpXOwO+iF9WTpihpZIhlIgCbCPU/cIvw=
X-Received: by 2002:a05:6512:3c8d:b0:513:30fd:2985 with SMTP id
 h13-20020a0565123c8d00b0051330fd2985mr5648347lfv.0.1709565160554; Mon, 04 Mar
 2024 07:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info> <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com> <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com> <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info> <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
In-Reply-To: <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Mikhail Khvoinitsky <me@khvoinitsky.org>
Date: Mon, 4 Mar 2024 17:12:29 +0200
X-Gmail-Original-Message-ID: <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
Message-ID: <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jiri Kosina <jikos@jikos.cz>, 
	Linux Input Mailing List <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Stable Mailing List <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> I'd be glad to test the module with this patch applied.

Sure.

> What's the default setting ? Should I set any parameter in sysfs to get
> the desired result (apply workaround) ?

Default is 1, so you don't have to change anything.

On Mon, 4 Mar 2024 at 17:07, Rapha=C3=ABl Halimi <raphael.halimi@gmail.com>=
 wrote:
>
> Le 04/03/2024 =C3=A0 15:52, Mikhail Khvoinitsky a =C3=A9crit :
> > Hi,
> >
> > Sorry for ignoring this thread. I've submitted the fix [1] quite a
> > while ago but it is now in hid tree targeting 6.9. Maybe we can
> > redirect it into 6.8? Jiri, what do you think?
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/=
?h=3Dfor-6.9/lenovo&id=3D2814646f76f8518326964f12ff20aaee70ba154d
>
> I'd be glad to test the module with this patch applied.
>
> What's the default setting ? Should I set any parameter in sysfs to get
> the desired result (apply workaround) ?
>
> Regards,
>
> --
> Rapha=C3=ABl Halimi
