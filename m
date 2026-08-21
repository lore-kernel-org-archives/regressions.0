Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8F30EF80
	for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331574; cv=none; b=oOXTujd2M8gNULMF2brYRDoHY/TcVRmmt7NqveM/dA+NmUb0M4MyAX6CkYR/qmFTSaK9kMQKA4CnJKuFMdWUJ3gAsHEWya3qNVME3Tec3/cYmPNlKFEb0fVvXPed6LHPh7kzJ2PVKisTrwjSjJj54W6HXCSHHaeWW39dykw5D4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331574; c=relaxed/simple;
	bh=EsfepmfSMGtC33MRHAs4PmLvOsXAz+kfpxNfNQvy8FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAXFJZ9/X+6RyFnH3czilWz9p7yPaCN2Bt751huQ6Z8pnkcWfXtqkgJYdX5tEGhRiZfVrcPW5p4+Q8GrLX6+rkWWeKh0pIMGn6GQDrAnANCWXKsbav/EME/gPioHBQuj23CbMjT7FQJfIff91VFt/ciw7rzfgjqx6N4ksmHev4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EDxaZ/wF; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EDxaZ/wF"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15b1da6b82so138598266b.1
        for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787331569; x=1787936369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xokLfb8L2ciLmaqOTXaVllobp4qCHV51wagGKoc3yqE=;
        b=EDxaZ/wFCD0yM/xWgw2uTzYhGlmA0bIEpIL+utZHygayblXQ8PPPM/qVSRGqZuaf8T
         8veZOmj8kWQi0YrVWP8zPSrRwhCiYlbKTwOnGCnKW1Qsvi5TwEWoCmQ2ud2MjNBIi3Rg
         uFfQYr229Kdy9qcm/tFZRNS4S2gyyn3ETa17BigzaQ9GINLudzqR6wXl8ruS+45CgY8h
         FfKp/VpAaMfYlNfdiHmAT2CupI4DlFuPe9Cj4HVc2e5oTmr21OV1dH/dHIdaycJUpqVl
         tl0fXOyT9+qz9enuuzEZ0Wv4RzPKYXJ28nBFgFzSqMfs9KqTnlMCPW4D/akdquIxKm3O
         jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787331569; x=1787936369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xokLfb8L2ciLmaqOTXaVllobp4qCHV51wagGKoc3yqE=;
        b=eCZcjSXbq6XV/M4x99bkV+prXZ15hYETyJpk7zoFWHboDEIZwJvVvYecQtcWnfOiTs
         +KbMD3ClWvGpH2IrWmFqWD4u1Rw3Ni3L58Quqc+7YrmddPTnQuISdO549P6SV/m3Og8o
         niYAs4n/ihOYNhktl45IOupzjDsb0Qk6xeecHu51ACt2GmBC108W64fJS4VAV0ULh5TI
         9AvS8Mb7gl5d7vYjyPCagCnq9KxAbJ8WPaD5pktPldAehNf2yCo1eaQTYoR0ObmhXX27
         KygI/en8rRNXWjKv4uDlGwW0P7VE44Np3KcEe6jRDq543ZNo9ebTbNMrTzR7WyzY3Op7
         DvLw==
X-Forwarded-Encrypted: i=1; AHgh+RpcKGOlvyHxQalLcXtDch1QsUThOVvsLkICe70SAuFZAUdgVd26RPZVpiRiXwrM20NT1qDd825RsLdxhg==@lists.linux.dev
X-Gm-Message-State: AFuF++mfK1wfGkpV4wHrp7udQdGR4OdnEt4RmKsim6gmmc2YZ/zNizMQ
	F7W0vS6YJapiLVeUp3m5JhZrNGH5ZluiKxiYCsH1DIXUvKSmX8ccRLlwrZ1778sLR30=
X-Gm-Gg: AR+sD12u1MOTIzRgA6gxXgn8MItH/VqBW0kj9u1H00c6bI3wi2LJvVL47IVDT0ZLaA3
	bCcIU1xzrf+G/WLcOXUueQbLpwjyHMw4nWYmNha8Zrwf5R7KF/SpXBQiNZ+S3c949leK5X4LbJ+
	rJS7N0QaywfZxBK64JzUfKhbKxqzSGhDASmvtBXDO50dwL2sUQQdod1IKqoj6QL3VF0jwuZqAjJ
	UH9WyFlTt3+nBEPR52hmOxBY4WGosoLVzL+WeoC0uqMeTBrNdL/+/vaekx2DfzkG8FJ3/z//Y62
	e3Ho+0O/ZXdLHlLqkoGzloczInOXeIvjyMrOe70Jr8o2CSzsWq7Y5NNYBn+iXgofiidsMBTfrJo
	PZI5YbEdIz0YKGXgyyG+NllIwykiVc4+XverzkH5pbSE/Dj95OvVUwAJG/odXZVzmet0YvZLASG
	NBxMz4oltqg1x1NgtZq/0uHloKEKlVVuwgt2BWL2N/VwAynZpfAQUJQd+YXcVATGDktUVrN13sq
	A==
X-Received: by 2002:a17:907:9602:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c246a60c587mr751214166b.11.1787331569333;
        Fri, 21 Aug 2026 09:59:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff178289sm7713116a12.30.2026.08.21.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:59:28 -0700 (PDT)
Date: Fri, 21 Aug 2026 18:59:26 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Noah Elias Feldt <N.Feldt@mittwald.de>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Dan Schatzberg <dschatzberg@meta.com>, 
	Peter Zijlstra <peterz@infradead.org>, 1144314@bugs.debian.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: refcount_t: addition on 0; use-after-free, regression from
 260fbcb92bbe ("cgroup: Move dying_tasks cleanup from cgroup_task_release()
 to cgroup_task_free()")
Message-ID: <aoh7Kbt_WbUcfUxh@localhost.localdomain>
References: <FR6P281MB6118B1A758F3278BC9BA795AF0DB2@FR6P281MB6118.DEUP281.PROD.OUTLOOK.COM>
 <178682274912.1759826.11422695267451330087@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtl76bd5brgzohej"
Content-Disposition: inline
In-Reply-To: <178682274912.1759826.11422695267451330087@eldamar.lan>


--dtl76bd5brgzohej
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: refcount_t: addition on 0; use-after-free, regression from
 260fbcb92bbe ("cgroup: Move dying_tasks cleanup from cgroup_task_release()
 to cgroup_task_free()")
MIME-Version: 1.0

Hi Salvatore,

thanks for the nice report and sorry for not so prompt response.

On Sat, Aug 15, 2026 at 09:41:14PM +0200, Salvatore Bonaccorso <carnil@debi=
an.org> wrote:
> With an additional reproducer provided by Noah, I could bisect the
> change down to=20

Good job.

>=20
> 	commit 260fbcb92bbeacfcd050410fdc2d24ab15044400
> 	Author: Tejun Heo <tj@kernel.org>
> 	Date:   Tue Oct 28 20:19:16 2025 -1000
>=20
> 	    cgroup: Move dying_tasks cleanup from cgroup_task_release() to cgrou=
p_task_free()
>=20
> 	    Currently, cgroup_task_exit() adds thread group leaders with live me=
mber
> 	    threads to their css_set's dying_tasks list (so cgroup.procs iterati=
on can
> 	    still see the leader), and cgroup_task_release() later removes them =
with
> 	    list_del_init(&task->cg_list).
>=20
> 	    An upcoming patch will defer the dying_tasks list addition, moving i=
t from
> 	    cgroup_task_exit() (called from do_exit()) to a new function called =
=66rom
> 	    finish_task_switch(). However, release_task() (which calls
> 	    cgroup_task_release()) can run either before or after finish_task_sw=
itch(),
> 	    creating a race where cgroup_task_release() might try to remove the =
task from
> 	    dying_tasks before or while it's being added.
>=20
> 	    Move the list_del_init() from cgroup_task_release() to cgroup_task_f=
ree() to
> 	    fix this race. cgroup_task_free() runs from __put_task_struct(), whi=
ch is
> 	    always after both paths, making the cleanup safe.
>=20
> 	    Cc: Dan Schatzberg <dschatzberg@meta.com>
> 	    Cc: Peter Zijlstra <peterz@infradead.org>
> 	    Signed-off-by: Tejun Heo <tj@kernel.org>
>=20
> But there was the suspect that the matching commit might be
> d245698d727a ("cgroup: Defer task cgroup unlink until after the task
> is done switching out").

I see that after 260fbcb92bbea ("cgroup: Move dying_tasks cleanup from
cgroup_task_release() to cgroup_task_free()") it may be possible that
tasks on the dying_tasks list may drop their ->usage to zero (since the
actual unlinking only happens in __put_task_struct).
Most often those would be skipped due to PF_EXITING except for the case
of thread group leaders (which the reproducer stresses) whose refcount
apparently can drop to zero after task->signal->live > 0 made them
iterable :-/

A band-aid fix could be to use tryget_task_struct() in
css_task_iter_next() (I got that hint from a LLM) and "skip" zeroed
tasks. I see that commit fbe3fb103596b ("sched_ext: Replace
tryget_task_struct() with get_task_struct()"), assumes the iterator
always succeeds in obtaining the task reference (which was the
justification of tryget removal). I expect that sched_ext should still
be fine if dying_tasks with zero references are skipped. (What are they?
Tasks which literally no one should be interested in and they're only
waiting for __put_task_struct_rcu_cb() to be called [*]).

(I'm calling that band-aid because it'd resurrect usage of
tryget_task_struct() and it keeps the dying_tasks list a weird place to
be. If anyone has a better idea?)

The commit d245698d727a ("cgroup: Defer task cgroup unlink until after
the task is done switching out") seems a reasonable separation of the
stages to me.

Regards,
Michal


[*] Except for io_uring_drop_tctx_refs() that calls __put_task_struct()
directly (no RCU) but I'd argue the same, that those should not be
possibly iterated.


--dtl76bd5brgzohej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoiD6hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiB/QD/Qx0ZJRbpqviaym2eUhdy
AMfR99jU7RJJ+BnLU3zCy5oA/0JzSShj4XvDjSj7Pk9/fS4IW6CghDVOxoYWP5Od
1XkA
=22up
-----END PGP SIGNATURE-----

--dtl76bd5brgzohej--
