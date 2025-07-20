Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D37BA27
	for <regressions@lists.linux.dev>; Sun, 20 Jul 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753026371; cv=none; b=epaw8wcUgbP+qZ1KUhrMJJwt//eZ0u9AqmW/MHEtm3gwGtR/avm5ggBhbGWw7Q2L1BQRiRs7geXd/wuhPm/dUdv7cGX0D6KPpPkwKOpVVLm8dNfnRy5jAn+tote8IhWHcf9Mmadcsfit/YhVtckAF6FP1aKmdczB1TWpqZ9JRak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753026371; c=relaxed/simple;
	bh=lSzngzU8K2SMJnQs6WdlqkNG96qrVe6sugTMORw9faQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saW2K7+bMxu20jPvbmrihtdWdQaSSy+Y7bm3H7scYPm49fMp61JZRCDvppMHWfuDPdDV5qlbrJrVhx6qOhX98I8lmw6UNP+QpjgKekJdDlxrXRhbSvOUj+GXKToIwgMs2C2G6tff2rrd0pM3egVeUSqDXXTeENnyOjChvv9kzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDLdb5SO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDLdb5SO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34dde96cbfso161940a12.2
        for <regressions@lists.linux.dev>; Sun, 20 Jul 2025 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753026369; x=1753631169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnZRbEHvrWqwwoCK2Ohh7fP97viVDvWI0vJOnqr5Ptk=;
        b=mDLdb5SOP0yTgjZUbmpSyrb/YsVCu8JO2XljNBo2Pq0Mif01hGB2dqHBkYlJE7zV9H
         OiTI2A2eysKMRoRv+B27aEYsUI6JRSywBdJvmZ7soscoE9t5wM8h+YtCQP8ytW9m3tWp
         xaBBh2smUzuaB0uUNDngIX1xM9QTqYQ9rVNoKKkjsNW0bsiLQL9j2WSrOPih5X/I4scY
         9oKElG3z32aRpxbrNyr/ZsdbPHkfhUNGqp1TVAA/cyanUONDNqFrAxtKTIDFV9eI0YmJ
         mPPwh6Ez9bR4c5wSjx5UEMR3pnq+POH7KvHAJaL5CIMhDCS4k3oZAw1Cd2mxkOeYITio
         zDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753026369; x=1753631169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnZRbEHvrWqwwoCK2Ohh7fP97viVDvWI0vJOnqr5Ptk=;
        b=dSrt1xh1GsodRMq2SugfJgjc2GAYCGP6846aeh/z6W4I1DkxeuZIbhuWN086WbvfvP
         tmLgmXyJMO3EocFmyiKnKuXp4iX/f4bY0erGftrPGyZ2INcsvE1jC5nE0l4BuE+whVmc
         radhZtMB0kV7spP3apOckmZhM0TEpym22UkW8t+H+6uoASsWZbTeJhtfYlYBgQAm2S9h
         JHJqZlATM63bamh+ZwVgBqMDn1ZktVowmR3SEICoizIiKVcbiTJGJd811OVd+QE9x+/m
         p/TSnMBcwTRoqqQ2AsSOEjXtVFN5EZ0OLjAMln6LF11UN9aQgk7BfBM71jLiU/+PgSms
         27Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWTyDUz8cunH5Uxku3/B44CKAbke4OvoKWXfYoqknlFsdGmA4JPa1bxKCQyN82UKc4qmqaiaYL4QnQIVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx5JMMhgnRfImzKZo4SJBk0OJd/C1By7+FIkdYHfhXGRb7oKyI
	cUL4Cecx5cIN8xlGlfMO4oBYJmOFaH0IVvtDQmOrS5cEdLq2HGyzkjc8VBSnmEp7AOn+R21D+3p
	Fv5IbBz2FrZ9wgwVj/ZjXlxOL2zq4RCE=
X-Gm-Gg: ASbGnctziViVB5zzXXuhK9Jyb4jnLyIf3U7IduSqyAftlWCIqQ/TtR0bWVcw8ALDaXC
	NyFituVCYLIZkUJZzu1NRXnku7D3eOlmnQAWkhUfxRbtvKNllRYj9JnfoE544lLX+7okIOgjOkO
	XiV7ApnA6yliyOPEeAiBIq6/QQf+jrUAxZfyn/7dGWtGSEu+L6h4k9KGISUudzm8RZehXJ9OAnd
	2WUcqgj
X-Google-Smtp-Source: AGHT+IGGPchfyAcycyyOZ+Lypj7ofidYeGaTHiUJYAWIE0Rzupw3F5hYF6EaTOs4PiW9tDEMbAkGK8k3f3hr2/pHcc0=
X-Received: by 2002:a17:90a:e18c:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-31c9e77394emr9881794a91.4.1753026368734; Sun, 20 Jul 2025
 08:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech> <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech> <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
 <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
In-Reply-To: <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 20 Jul 2025 11:45:57 -0400
X-Gm-Features: Ac12FXwgi6dxvBF-8jB85wBXnDyIpcJFs1c8vLrrs2RRgFD8rZ1Df-61QlhoIdQ
Message-ID: <CADnq5_Mpsd_68T3uKqdXzHSzm4dWcHamYJZMNpPNZFHBp=DORQ@mail.gmail.com>
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Felix Richter <judge@felixrichter.tech>
Cc: Mario Limonciello <superm1@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, jonas@3j14.de, seanpaul@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 1:38=E2=80=AFPM Felix Richter <judge@felixrichter.t=
ech> wrote:
>
> On 7/19/25 14:23, Mario Limonciello wrote:
> >
> > On 7/19/25 5:10 AM, Felix Richter wrote:
> >> Thanks for the reply.
> >>
> >> I am aware that i can read and `edid` via sysfs from the drm device.
> >> I did not know about `drm_info` but from a quick look at it I don't
> >> think it provides the information I need.
> >>
> >> The problem is not that I need more information about the attached
> >> display. The problem is that there is not enough information about
> >> the what `i2c` device corresponds to which monitors ddc channel.
> >> Relying on udev hierarchies is not sufficient, because in many cases
> >> the relevant i2c device has no parent drm output device. So when I
> >> have no information about the i2c device I need to get more
> >> information by reading from it. Then I know more and can map the
> >> device to the correct display. I am happy to change the approach if
> >> there is a simpler way for me to get this information.
> >
> > =E2=9D=AF ls -alh /sys/class/drm/*/ddc
> Nice, I will consider adding that information to the logic for matching
> i2c devices to displays. But I do have to tell you that still is not
> sufficient in every case. It probably works for all direct interfaces
> that are always present on the device. But it fails to match i2c ddc
> channels when monitors are attached via a docking station using USB-C.
> Those monitors will not even show up in the command you provided. This
> again leads me to having to probe the i2c device directly anyway.
>

DP (and all of its variants, eDP, USB-C thunderbolt) doesn't actually
use i2c directly.  It's aux; you can do i2c over aux, but in the case
of MST, it's more like a network for displays so naively messing with
i2c buses from userspace won't do what you expect.  For MST, you have
a single set of i2c/aux pins for the connector which may have several
monitors on the other end.

Alex

> > I get where you're coming from, but there are cases that are
> > ultimately impossible to prevent when it comes to "long", or
> > "frequent" sequences and responding to interrupts. There are lots of
> > examples like this in the kernel that if you break what a driver is
> > doing with a device from a userspace interface you get to pick up the
> > pieces.
> >
> > I'll give you two examples:
> >
> > 1) You can access R/W PCI config data.
> > /sys/bus/pci/devices/*/config
> >
> > You can break power management state machines, bus mastering, really
> > anything a device driver can do from a userspace application.  For
> > example if I had a userspace app that did something like this:
> >
> > dd if=3D/dev/zero of=3D/sys/bus/pci/devices/${BDF}/config bs=3D1 count=
=3D4096
> >
> > and it broke how can the kernel do anything about it?
> >
> > 2) There was a case that fwupd was doing something very similar to you
> > with a "probe" but with the DP aux character device.  It was trying to
> > detect devices with updates and would fight specifically with link
> > training.  The outcome was non-functional devices.  The workaround
> > currently employed is that fwupd will wait a few seconds (5 or 10, I
> > forget) and then do the probe to avoid that fight.  This doesn't solve
> > things though because there are pulse interrupts that could still come
> > at any time. The DP spec has response requirements for these.
> >
> > We talked about it at the display next hackfest this year and the
> > decision was this information that fwupd was needing should be pushed
> > into the kernel (let fwupd probe a sysfs file that gets cached data
> > the driver fetched).
> >
> I get that you can not protect against every case of malicious use. I am
> not sure that my example qualifies as that extreme though. I am only
> trying to read some data, that is in no way comparable to actively
> changing values.

DP is a two way communications channel.  You may have the driver
training a link or communicating with other devices on the DP network
(MST hubs, monitors, etc.).  You can also get requests from the
monitor to the driver via hpd interrupts.  Many of these processes do
not do well if interrupted.

Alex

> >
> >> People have been experiencing similar screen freezing issues randomly
> >> on this drm issue thread: https://gitlab.freedesktop.org/drm/amd/-/
> >> issues/4141#note_3016182> > This example highlights an issue that can
> >> be triggered reliably with a
> >> very similar effect. It may not be the same issue, but they may be
> >> related.
> >
> > Yeah; I'm aware of this thread and agree it's an issue with similar
> > symptoms.
>
> At the very least I hope that my example code for triggering a similar
> issue can help figure out what is going on there ;)
