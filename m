Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960F85664
	for <regressions@lists.linux.dev>; Fri, 19 Jul 2024 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721415456; cv=none; b=JF6H2RGHURwTmN3hUFL3mCdEp20zYMma8rpUSgi9GnOEW9VCy8mmX+U4ah8LOr06PWc/fzorW3Vz5mgF+SKhcSzdpBJcOvh7wR4X5dGL1QlnYsgplDIexRtD23to0u3mQmNkJKPClnsBxKCwBJJezpaIWH51O5zq8rblK6vXbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721415456; c=relaxed/simple;
	bh=6KR+pmxeLTtH2tRJ2klpu1Ma61P22DO2CKiEJpvf5co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEUT/H8ZNZhalh3Rg1k1bu9GI/njefgdGiRPed4KGkA1flxG5Pzur8Xr3JjKB3Xrsnn0wtD4ZnHckVoywq64WaI08DDt9HdfGfkrXRBeeIj1SZxdjctC/YlIiupWQaDzisBTSj0iSPNNKjgIJWJJlH2FRBhSONsMbwGOoOeJRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eav8Kpv5; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eav8Kpv5"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-81179da9049so680589241.1
        for <regressions@lists.linux.dev>; Fri, 19 Jul 2024 11:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721415453; x=1722020253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip3h7VGQW/ACNut06jGAQyoClbNHht4iMIUnDrB895A=;
        b=Eav8Kpv58hRsHmYaWD3yxwnR1kiUTR5rssDoCLZTj2XJ1M+piUFvGV/biWYar/98ar
         rstCkdS9ucbAkpjhAHNw1infZAZlc2fqFxezxdi4xFr0dilufqgOvFYZ5fLFaWunAVrg
         SzWI0dZlu2UXEl1z2/TIVqPSWe7nrjZY6dGG1h0eTUrjoGs5MrFiYOExixRaCn4mpIpA
         dStbwQP9TxL81CRKH730CC/WcsgEdUvbk6WWCsTsCgVUVXOrQnnP5OAeX1KOk3Y1/VCE
         uKCjkYYmdsl9tq74oPk2ydxv2CwJYL+psfmFeUbJvpL0AX1ZRDpbglO/81nyBdsgHE8q
         PZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721415453; x=1722020253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ip3h7VGQW/ACNut06jGAQyoClbNHht4iMIUnDrB895A=;
        b=m/Ez3Q/wPcgA8sXHKvd44v8kBujeQcaafh6Df/qIMJ1/tYDsmTnF4q25BlP7i2prrK
         UoNoNyfNKaXyrtB7sWVBz/C8UItYs+EEApwZcaf7a9/nq9BQibRK1qNIfYHIHl0Gp2E5
         ZtDD8/35LgHHs5ljOzXXSOLs/hO9rbbuJuyOF5HtDTJdXsHz1s1gXRKAh+qJbjByCoui
         OQ87D/ZVfsTe4yym3Yx7rs5x+4xWAOzOWsnxhcPyrCSD9e58dnlSFCKE2blksMaym93Z
         k0UKcpjxNzJMpeYhfVzq65IEpGaci6GZdVJsNel0vMm4EfdPkQeZIBWzxgVbk9ERB3Gv
         ++aQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ajEEgKTNnEmWS83nOMri6yJGSTshtmaQoWK5rnmYygXmheHXMk3igpIRIk4snHAMfJyCNUi6ndXWHKNXLpjsaObvD1wL/Xrmg28=
X-Gm-Message-State: AOJu0YxSMERoJDDUotz2u738A1IqHkGxaudaHUka6bEtRQk+fgF9IhQk
	1ur2B4oL/xrRgcqUh2jFXiqZLe+LuNrT+4FJDckTaKDtl90DMkJSkNakvNZ9xJC4G1iiIoA4xo4
	SE0a9vOpIFIZuaraEabGR3sb4WI4=
X-Google-Smtp-Source: AGHT+IERf9/Xps48kV2W7nS4RryP3dSSJlqo0zdteVRW81icpznCDJJbkvVGfjiztfU9CcTYTJaZwhLDGN8Ldan8YCc=
X-Received: by 2002:a05:6102:504d:b0:48f:e46e:ab8b with SMTP id
 ada2fe7eead31-49283f33784mr892492137.19.1721415453276; Fri, 19 Jul 2024
 11:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
 <CAKEwX=NkWzyhb6dZeV1=sGKwurwhk7wMcH_RtwJ9ztgABjMyfQ@mail.gmail.com>
In-Reply-To: <CAKEwX=NkWzyhb6dZeV1=sGKwurwhk7wMcH_RtwJ9ztgABjMyfQ@mail.gmail.com>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Fri, 19 Jul 2024 19:57:21 +0100
Message-ID: <CAKbZUD3yM0kjbeqdscG3gVhoMz5hNZjCxV9xSQepCEpL=qGa5w@mail.gmail.com>
Subject: Re: zswap_writeback_entry crashes in 6.9.5
To: Nhat Pham <nphamcs@gmail.com>
Cc: mm <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Christian Heusel <christian@heusel.eu>, yshuiv7@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:07=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Sun, Jun 30, 2024 at 10:58=E2=80=AFAM Pedro Falcato <pedro.falcato@gma=
il.com> wrote:
> >
> > Hi everyone,
>
> Hi Pedro,
>

Hi Nhat,

Sorry for necroing, but I've been really busy and this issue totally
left my mind. Following up so I don't leave you hanging:

> Thanks for the bug report! Taking a look now - some preliminary
> questions to narrow down the suspects and aid the debugging process:
>
> a) Do you observe this bug in 6.8? 6.10?

Yes.
>
> b) Have you run the faddr2line script to verify that the line that
> triggers the crash is count_objcg_event(entry->objcg, ZSWPWB);?

I did not (distro kernel does not seem to have debug symbols), but
it's pretty clear from disassembly.
>
> c) Do you have a full dmesg log? Or maybe some other reproduction instruc=
tions?
>
> If entry->objcg is garbage, then this smells like a lifetime/reference
> counting issue. Either:
>
> a) The zswap entry itself is garbage. Not impossible, but seems
> unlikely. In 6.9, we effectively isolate the entry first through the
> swap cache, then check and remove it from the zswap tree (under the
> tree's lock). The former locks out concurrent accessors, and the
> latter should have taken care of invalidated entries (and prevents
> future invalidation attempts). Furthermore, after this, if the entry
> is somehow garbage (i.e freed and recycled), it should also be
> possible to blow up in the decompression step first, by feeding a
> garbage handle to zsmalloc and crashing the kernel at that point. IOW,
> we should also see zsmalloc crashes in addition to this particular
> crash, no? I cannot think of any protection mechanism that applies to
> the decompression step and not to count_objcg_event().
>
> b) entry->objcg has been freed/recycled under us. This is much
> trickier, as the culprit could be any holder of the objcg reference
> who accidentally double-released the reference it held. That said, if
> it only happened on zswap shrinker path, then maybe there is something
> to this...
>

I have a separate theory. I also run the NVIDIA proprietary drivers.
slabinfo -a shows us:
[...]
:0000080     <- zswap_entry Acpi-Parse kernfs_iattrs_cache
uvm_tools_replay_data_t Acpi-State audit_tree_mark
[...]

See the uvm_tools_replay_data_t there? Yeah, it's entirely possible
some random nvidia.ko bug has been corrupting zswap_entry from time to
time (which explains why e.g the big server people have not seen
this).
I'm not sure if Yuxuan is running the same driver, but their kernel is
also proprietary-tainted.

As such I'll refrain from posting more about this or similar bugs
until I can get a guarantee it happens with a non-tainted kernel
(fwiw, I have not seen crashes for 2 weeks or so, hopefully this issue
is fixed).

Again, sorry for not checking the taint before posting this, and thank
you for your time :)

--=20
Pedro
