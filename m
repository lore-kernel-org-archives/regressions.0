Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B74202C4B;
	Fri,  6 Dec 2024 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733488516; cv=none; b=LlYBgKhL3dzpyfZQZYqLA/YrQzuDKstlB1Dgl76YebMp5vJ2Fca+nYAJPaWGk+9sswnXzMki59VqYYlfSPwTjpXbQV2xrVNvNB7NME14C06SY3Gwy/y3ASR5x1ohNoJKboMhc8oY7hDpW4KgvM9qzcs5RAnEsDeCj7mwDXVWsc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733488516; c=relaxed/simple;
	bh=tglxYqpw8kY5WRMteTGZtIlEcVhj/Jpqf8p32WV1aVE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACPe06nhZpIT4UnH32T8csKuUBMARB2CvFsef45pK6b44uVRwYJdknOogsUfzb/fxyh46zz0k5FIkmowIPNjmuyPrtU1/gONEA1giYPiUPP7iS+r4ZQAyi2s2fT6AGIbbSmNey1UxHYpxyFXKlJSSou9OMGhwUeB3euQh0QjfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMBrakDH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMBrakDH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa503cced42so285329366b.3;
        Fri, 06 Dec 2024 04:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733488512; x=1734093312; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6PvnI7O8BCrsugwoXvIAfj4V3SCjwh4w+40SQgRUeo=;
        b=mMBrakDH+8HRucoRRNmquMppvWTz8A0i00JLJklYYtGhhtatbNzXVLMRBelXDn2Jys
         JVUzSlN4XbUbeRMb7WyxZCDYy1ZYX6kMYFrFSFsYDpWmM1PsqvBbHc/YCm3u2gFAyxja
         UCX+CfvqAZL0eX2DPyS2IUhLEVcqMuqoxmncpJZ9SFJdHyR9qcelHztEec4QKm9/eYee
         uH74M0KGaNDk9IOx8dPPMXl609ESbOQMg8snZMGDoQAOFJSiNkKLx6FT4jrX8Ur/Jejg
         HUvIFUpIKSz3/TPz26RoMI+qrwOxz49D3kNt9VUy1OpUZweEHVuoT4jAZTXX6rLIeEm9
         DTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488512; x=1734093312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6PvnI7O8BCrsugwoXvIAfj4V3SCjwh4w+40SQgRUeo=;
        b=m65MA38wFU5QIEq6yQADxAMPv+9BGyGD0W8amDe5YvAPHQqLerR1l3UzP91i8rUEKe
         /al/g7o0v9d/dUPwoEP3zyULl3GEAcbDWV3rt3LFkgNq+mlWbfTtugpg2VGRksvkKCJY
         0m3FOh4FuMZkLMqO+ef9RMZa/bQCabqMv0kYZcfBvK3+i3AbAg2exmXQLbwk7uOSB9px
         qNSmCMPnVic8nKheSZlOiFK6iLOf8fqBb1eOScZaOVdj4icCGvRB4Y1GUmTw7SBfFBE6
         PkO8sC+RWOCVAF5xZFlEifuozmimF4kNA60lpvtHUwonxUgHD5cHuxOWGOu7Ud1ZLcTx
         ikag==
X-Forwarded-Encrypted: i=1; AJvYcCWU0fGmD8Vdmv+0CwSC6OiEmzuSBJZ+Q/qv7xWNJddt7ULLCH/0yUhN0GrO71VaWK9fGPkQvRM6idhkeno=@lists.linux.dev, AJvYcCXegWolWBlaAy8JHENP3MtT8eTmca4uboMYiHMJXd2A4w0IifhMFUbddM3pEdV2gtBEwmnJO0xYE645pVmxQ5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YykPgui2ELMB+ty+RSCawO6JcOyzwj/TQuXkqB71JQDqjYpTcyT
	FFqN89yK3vRKfnLOq+TgHuzqD667mijNujodQM2p93b5I3DcqqRa
X-Gm-Gg: ASbGncuMNPIDKhzaIEl2LA/vQwk6qDvHo2g3uPDesV/WEZz+yRRTpjhBB6i21ldyxu8
	Adcn+5x2rDZk+c+QTfqsaZ1Yg4UAe52UHUbHX9O/UB3RFrxbxHRMI/qjN5hII2FdOqyonMV7pXB
	rj3C9DqMsff4i9b8CMfVo3JlxGDATpwZl30aJCKJfMfonej27dSBqho5kLs6f/mtfmGCssxs8Ei
	EnTocqRLDYjSqLw8/dBawWTFGQ+TJRvnksCcfs5ATqdoW7+gBIZJVr77xZqbRQhTuVe4eeFdFO0
	IsVMpsRrhsrVu2qgaqJJMsg=
X-Google-Smtp-Source: AGHT+IHPxphMS4Qk/qebUjsQnqXB+pmqqV+jQbEkFsAiVmVVudNvGQtOHi6M0kzkTx8dBwklanyjTQ==
X-Received: by 2002:a17:906:2931:b0:aa6:313b:469e with SMTP id a640c23a62f3a-aa63a3776bdmr171084666b.52.1733488512309;
        Fri, 06 Dec 2024 04:35:12 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e0389sm232510066b.174.2024.12.06.04.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:35:11 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 6 Dec 2024 13:35:10 +0100
To: Laura Nao <laura.nao@collabora.com>
Cc: alan.maguire@oracle.com, bpf@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@collabora.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
Message-ID: <Z1LvfndLE1t1v995@krava>
References: <20241113093703.9936-1-laura.nao@collabora.com>
 <20241115171712.427535-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115171712.427535-1-laura.nao@collabora.com>

On Fri, Nov 15, 2024 at 06:17:12PM +0100, Laura Nao wrote:
> On 11/13/24 10:37, Laura Nao wrote:
> > 
> > Currently, KernelCI only retains the bzImage, not the vmlinux binary. The
> > bzImage can be downloaded from the same link mentioned above by selecting
> > 'kernel' from the dropdown menu (modules can also be downloaded the same
> > way). I’ll try to replicate the build on my end and share the vmlinux
> > with DWARF data stripped for convenience.
> > 
> 
> I managed to reproduce the issue locally and I've uploaded the vmlinux[1]
> (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of the 
> modules[3] and its btf data[4] extracted with:
> 
> bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd_led_backlight.ko.raw
> 
> Looking again at the logs[5], I've noticed the following is reported:
> 
> [    0.415885] BPF: 	 type_id=115803 offset=177920 size=1152
> [    0.416029] BPF:  
> [    0.416083] BPF: Invalid offset
> [    0.416165] BPF: 
> 
> There are two different definitions of rcu_data in '.data..percpu', one
> is a struct and the other is an integer:
> 
> type_id=115801 offset=177920 size=1152 (VAR 'rcu_data')
> type_id=115803 offset=177920 size=1152 (VAR 'rcu_data')
> 
> [115801] VAR 'rcu_data' type_id=115572, linkage=static
> [115803] VAR 'rcu_data' type_id=1, linkage=static
> 
> [115572] STRUCT 'rcu_data' size=1152 vlen=69
> [1] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64 encoding=(none)
> 
> I assume that's not expected, correct?

yes, that seems wrong.. but I can't reproduce with your config
together with pahole 1.24 .. could you try with latest one?

jirka

> 
> I'll dig a bit deeper and report back if I can find anything else.
> 
> [1] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241113/vmlinux
> [2] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241113/vmlinux.raw
> [3] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241113/cros_kbd_led_backlight.ko
> [4] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241113/cros_kbd_led_backlight.ko.raw
> [5] https://pastebin.com/raw/FvvrPhAY
> 
> Best,
> 
> Laura
> 
