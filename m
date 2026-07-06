Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C02EEE77
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357660; cv=none; b=DvhTd2mCaILA3GG31xWmD/wIuCjg6/kt3pUXkMhaq90z9TOX936PT8vgHcm5N2wJWU7GFNFpLUTHkxr2L1eW71cgeJ36ozzyqZJcJcWaUlEboX/ibvsp6RyCFcv3WzM/JoSiufMesxOWnjd36ALqQVVJBxP+opxFm/FlcYYFP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357660; c=relaxed/simple;
	bh=La52E/eiMRqbkoa9U+7aHtBFszAa88Y67rC6/ILJHpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQuEbKp5vDrHCmszAXzm1mqYsqWPRhgi2ubiDnSYNQtDaWqIzWIuQvKkqJqM/aBI2dasB08HSyAFZXVo76FXIywpp5tFuDiYwjCIuoHn3dkdhWV0AFKndjMoVLdFDkM3drvevVoQPDEfcIN/EAHuLUkUYQ5eKRrXyKK9+sHIgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwBtk1P4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwBtk1P4"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so2705599e87.1
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357657; x=1783962457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTKln45GM0fk011qbQeayCXILczaZaZoSzdEKWSP20w=;
        b=XwBtk1P4VshC/ncq84GQc4YfPvpa3cLacCcoiO72Kl/a3jvl1q857BTnI3Zu0PXl4E
         53kNXS/GLTdnBrUyRuITVI0Vsu70CP4NBZjbZvi0fhAGtVjatfGQ+Ipi5artSpo1J6hr
         UZe/AaNt6ZvXmJoM8JDYB7IoK8hwLd3lFPJh0I3MW7HKcMR73Se0bfhFBHcAKTVIZR+s
         HPCZdOpGVUw/uM+KwkC5ucT0Rk7iv/cEuBlhd+Mj8K1ognSBc8LliGskQm6DSj2pRQJK
         mkQrHdVZW6CyhQMFYPqOQ7LZyrWQcrCyTi0+l9E3d97F4ICryZT75eP7PngURlsFFdri
         m04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357657; x=1783962457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTKln45GM0fk011qbQeayCXILczaZaZoSzdEKWSP20w=;
        b=WcgSpgk3MAJYq3KBrh7i6EKi2TacN9OSkhqsTnt1xibVTvZ3oBggmneATs+coNyAaK
         dKsQFkMQqq+gQm+UM+pJ3IpjujfgSpTQ9fdo1W79csq9cz5pj1StMuObB+LdoBKkP9qg
         NW96CppdSQK/VWBPLvYAEel9O3o5UHsDTebK31755kxKsD2lhzOrbsrH6n0hqJFCF9V6
         uV65lH3/goYgsKNWhEFwD6DE5jPRZ63mrLwxcrA9V/vP3DYnPVluGDjiS+tyBfHeyBrW
         GsW/NXpeTCPGlO2I0Jwt7q+fhXPNDUvG6fjG7LwQ4mVcZgyTftVJ8ZNiyAJsPdvGlhL+
         jvgg==
X-Forwarded-Encrypted: i=1; AHgh+RoOzs1t4AqaMGItk0SPMKhyfriQAtjVaWof9i7vNudDtSpGm8fV/5QwCTQy/b087UWJVeiOXgsnFtAmbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytT6MB8//J1mXMHZ5eupgXFnCnjsEFhUlMbIF6AnGPXsE6A3AV
	RpEZdor/MdsjGdQiUz1N7CuNH7qUrdEqreJEmYzzoeB/WhC5QWrDDF6u
X-Gm-Gg: AfdE7cn/e1kpJlNJ1yT0po5t1pc30dDSSY+qXjdpq3iMVmu/HC1hmMatDHG/A1XG5N0
	OSAJTP6gXXg0ark/yheWOzLfDwUBvWWsSjHbG2hMPMfEeN2Ljh2LjPahZ4eluEV8sC2tQHIyH5Q
	JLnWEH/qrDYev+jlFIE4B0mvYTbQuO8pzFThQVAodbGax6cVb448a3qG/TnYmBoLcpn6N6+XuIZ
	p9QaevF+FKzXuII04n2NvruHt8ojRr9NyHzjQXKxiu+BUn49pygoKqlK5s+iZqEXstj2o27yTI2
	XujzD4vMpay0paFfBUdwNlhMjNFb4yoFNL+krMdxrNMn3+kaxq010q3zHudqEZztRofh6dHtUhe
	7UnJC0E537VRcRlvspCu78kQJBAeuwszjY9YMcm3kTi+dT6zAFORebB8NiUcvSzXx7HhCDS4Dq8
	+aP0gc0wNtmY8sRHcFREsnbdMrX27qZxuPFQp+1PLxodwUWDNJRPOq3dKF9kyPBQP3lfYIfMDom
	iiOCHTqaLefQABhFvt43cJaqt0=
X-Received: by 2002:a05:6512:48cb:b0:5ae:ba8f:f9fa with SMTP id 2adb3069b0e04-5b007c0b9d4mr246661e87.18.1783357657394;
        Mon, 06 Jul 2026 10:07:37 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb774sm3031918e87.48.2026.07.06.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:07:36 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: jannh@google.com
Cc: arjan@linux.intel.com,
	brauner@kernel.org,
	ebiederm@xmission.com,
	jack@suse.cz,
	jake@lwn.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] proc: protect ptrace_may_access() with exec_update_lock (part 1)
Date: Mon,  6 Jul 2026 19:07:35 +0200
Message-ID: <20260706170735.2941493-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-procfs-lockfix-part1-v1-1-5c3d20e0ac33@google.com>
References: <20260518-procfs-lockfix-part1-v1-1-5c3d20e0ac33@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

while testing my Alpha generic-entry series on top of v7.2-rc1, I noticed
that several strace --pidns-translation tests started failing. The same
generic-entry series on top of v7.1-rc1 passes these tests.

I bisected the regression between v7.1-rc1 and v7.2-rc1, always applying
the same generic-entry series before testing, and the first bad commit is:

  6650527444dadc63d84aa939d14ecba4fadb2f69
  proc: protect ptrace_may_access() with exec_update_lock (part 1)

Examples of failing strace tests include:

  signal_receive--pidns-translation.gen.test
  so_peercred--pidns-translation.gen.test
  tgkill--pidns-translation.gen.test
  tkill--pidns-translation.gen.test
  fcntl--pidns-translation.gen.test
  xet_robust_list--pidns-translation.gen.test
  xetpgid--pidns-translation.gen.test
  xetpriority--pidns-translation.gen.test

One simple reproducer is:

  cd strace/tests
  ./xetpgid--pidns-translation.gen.test

The failure looks like this:

  ../../src/strace: NS_* ioctl commands are not supported by the kernel

and the decoded output lacks the expected pidns translation comments, e.g.:

  - getpgid(2 /* 6 in strace's PID NS */) = 0
  + getpgid(2) = 0

Looking at the patch, the relevant part seems to be the change in
fs/proc/namespaces.c: proc_ns_get_link() and proc_ns_readlink() now take
task->signal->exec_update_lock around the ptrace_may_access() check and
namespace link/readlink handling. strace's --decode-pids=pidns code appears
to rely on accessing /proc/<pid>/ns/pid for short-lived tracees in a nested
PID namespace, so this looks like a plausible connection to the failure.

The kernel has the relevant namespace options enabled:

  CONFIG_NAMESPACES=y
  CONFIG_USER_NS=y
  CONFIG_PID_NS=y
  CONFIG_CHECKPOINT_RESTORE=y
  CONFIG_PROC_FS=y

I also tested the basic nsfs ioctls with a small standalone program, both
outside and inside "unshare -Urpf", and NS_GET_NSTYPE,
NS_GET_PID_IN_PIDNS and NS_GET_PID_FROM_PIDNS all work there. So the failure
does not look like missing namespace support or a simple ioctl-number issue;
it seems specific to the proc/ns access pattern used by strace's pidns
translation code.

#regzbot introduced: 6650527444dadc63d84aa939d14ecba4fadb2f69

Thanks,
Magnus
