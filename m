Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858982B2DA
	for <regressions@lists.linux.dev>; Sat, 13 Sep 2025 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757782875; cv=none; b=K1whJN2jnN4nMUQSfhSL9ddenDaKOjLrLpOXWDirXyZxdCcTmeb3NRwnp8cSEFvX22bbw0TXL6c9m32eyzS64ttxXcpSCqLpvn2hPWpfWjxlCU0JLEEqkNunh67qANOiR906kscQ1jkqnnva7WrwQVXt2USe/oV39d2hcd8fy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757782875; c=relaxed/simple;
	bh=fAl811+LJx+57xhD3ZDBRMsx59Zi632qqhWlpTaXmmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=N/gUtJ6oG7o3tYNTJjc0zilHF+BU98xsfjtT59nYh/hSsliz7wIvGWhoGSEA3J3ws+HWXL6mPHBnmst+bZwxiU+665cx38ydHQpoR81n9HfTOnSGCW2LLxuzRkLAjbHhCeFt/EFC36nisWoA3me86W2O2rNpiYsRpdulfU54ErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhcK3oWK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhcK3oWK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3df726ecff3so1640576f8f.3
        for <regressions@lists.linux.dev>; Sat, 13 Sep 2025 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757782871; x=1758387671; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jVrbxVggAGGjVPECN0iWVqlzdgucYLKcpcWurPyD3c=;
        b=DhcK3oWKXvAN5U9X2hyUzL+292iGCyfHaa24n62SG1MIC3I8SFNeMFwj4Qhm92s7Zm
         RbrhEV4mfcFfs/osowUlVfsLvVnpeYMw8YV+KiLW9ezX8meKp/dvp1tTh4FjGtd1m6WN
         1rOU/LJlsEpVjNTMxzWOku9TkS4+2UfRvqNEKqnssLEzjSIWmfdl18F6TdtXSFEKvjYu
         BK2Sw+78yDLJQcYg1WKo9yDqX4XREnviFOWyyCB6q0t9wwthzxTL+1+VB2BjBMDPxdNF
         HRBo7Kwi/vtYqd9wI4rdq2btWC/nRx69nWMI4+8n97ICiPlHdRMyHWVdKD+cIF4x/ZRE
         6FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757782871; x=1758387671;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jVrbxVggAGGjVPECN0iWVqlzdgucYLKcpcWurPyD3c=;
        b=llGFgc/Y/I45fFOO5gracq8uk/ed7HIc5m6eM4ClCYnFl6jgMsrJsy1BswTBKHdIhy
         UodrK7OLZjv2RNoYdvat1Lz5Hx7ockoErrSJkoxxu3i6b6iOqy9eQFT5XZsI/eO3/MiD
         x7keyvjPXtTK2NTFBYvMAm0UaKvrL9j7WKsqdAR1LRKgWYe0rAcsJxKgrXtOu9ahDriu
         ZdB/zJxIHlMqFm7aP1ov4EPld4GuW/7S3noT2zOd6WhWZLUK8EcKAza+GZJNAxG5IY1g
         FNCQokNhzuUZb94Rjc6rjVShk2jd+GXFoIzK2KjWO1K3+mu5g2Ko+r3eZ9Gjs0jqIOYk
         e5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpjhDp2W2+zkrhWqtD3F7aIItfnJ6DAkU400g3U6nom3gRjidzuuv4ZyM+5QNZjJTAqSk5kMMhlLECwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9CidiCdi0cqPlqJvHG8etdcDUHEWS31WH2HdHMgPOe92oHyTc
	Lyux8LBzjwZE6qGIFzjA/1n7/2wtMEsuyOksLtC17Jn9sQEz3tAOTGag
X-Gm-Gg: ASbGncuGfFJzmZFdTwjakkaiXd5WRam6TIcQn7SA8VYvPMEXNlY7mbasUlYmrTQHa9y
	XgRFgrEXa6I+4fHift0MCDM986jI/7uV3TuF8a6ZTVrVjxjHzO7Yl3zNJq4kVGY8hhGxeSkjqRM
	7SQSZa61rNdOCJa5e86UzRp/t+LXY39BegG8BrPkVkzApbs3UKdQAqQJhWIGmig2Fl/P45T759k
	s+deb3o49pGReKup2mpHCjDGxi0AymMoeHgNfuDsFoc6WQL0mOCLb3ASkEsa996FKWRSQCNuOxW
	8FSnelsyYufTKPMxAVQ9t34WOP+h83G9cgi0Gft0BD6qASWaUkTX/M75yTj7VKLDhxM6cH7MyB4
	FrhmVX6vSb3HhBgpuJ7ZR0Khx11/xaYjp8RzWbIa2jKZ49TrbSnNwhW5BH4YaZkSb2Fc5n9oab2
	34M1s=
X-Google-Smtp-Source: AGHT+IHxuiEOQg1v7lYGNdadask14TKYGQh97aQt2avC5UpjAiAMPfP2BgCYtn/tTDqWMXPMlc9qqA==
X-Received: by 2002:a05:6000:2510:b0:3e4:ea11:f7df with SMTP id ffacd0b85a97d-3e7659db441mr6402177f8f.40.1757782870686;
        Sat, 13 Sep 2025 10:01:10 -0700 (PDT)
Received: from [10.33.80.40] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e80da7f335sm4379634f8f.8.2025.09.13.10.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 10:01:09 -0700 (PDT)
Message-ID: <e5d594d0aee93da67a22a42d0e2b4e6e463ab894.camel@gmail.com>
Subject: [bug report] [regression?] bpf lsm breaks /proc/*/attr/current with
 security= on commandline
From: Filip Hejsek <filip.hejsek@gmail.com>
To: linux-security-module@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
  James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Date: Sat, 13 Sep 2025 19:01:08 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello,

TLDR: because of bpf lsm, putting security=3Dselinux on commandline
      results in /proc/*/attr/current returning errors.

When the legacy security=3D commandline option is used, the specified lsm
is added to the end of the lsm list. For example, security=3Dapparmor
results in the following order of security modules:

   capability,landlock,lockdown,yama,bpf,apparmor

In particular, the bpf lsm will be ordered before the chosen major lsm.

This causes reads and writes of /proc/*/attr/current to fail, because
the bpf hook overrides the apparmor/selinux hook.

As you can see in the code below, only the first registered hook is
called (when reading attr/current, lsmid is 0):

int security_getprocattr(struct task_struct *p, int lsmid, const char *name=
,
			 char **value)
{
	struct lsm_static_call *scall;

	lsm_for_each_hook(scall, getprocattr) {
		if (lsmid !=3D 0 && lsmid !=3D scall->hl->lsmid->id)
			continue;
		return scall->hl->hook.getprocattr(p, name, value);
	}
	return LSM_RET_DEFAULT(getprocattr);
}

Even though the bpf lsm doesn't allow attaching bpf programs to this
hook, it still prevents the other hooks from being called.

This is maybe a regression, because with the same commandline, reading
from /proc/*/attr/current probably worked before the introduction of
bpf lsm.

Regards,
Filip Hejsek
