Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E11946B3;
	Thu,  5 Dec 2024 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394786; cv=none; b=W/j4tEPEtCh0j0V4QE5f+d6KUxpmURzvpYHFvys2TiNivvGzEDzI2mo9rJe1eJ/DGvnW/0ji9NqQCeFD1wK9lhnz+HfnmyS478mJWBK/H6nX6HrOVVoW7EaBy0Qiy/rJvwIHSNYqnJgxsw6dNdUrqwBjbewF50Np7RwatBAjIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394786; c=relaxed/simple;
	bh=eQOR06vgtGzzybcdYp0pZ3dmCpAwjfqkKijb7ds4SiE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6Vhsg9FCRgobK2mjTeKPeiAacCGvWcwTmbQSMudWGT4t96vZUf3fszFNEZpYdMUPHCGKXN5owt8vrCvrbIdbxkIq9TIPx5ZkXAUYzEaaM6nvRybzlLhe2rMPiqPeOR7jECXN1dGlaP9sj5iJCaKrQjtGbpMhFDblBKYFoLJy9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrXZ4ine; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrXZ4ine"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa549f2fa32so144679766b.0;
        Thu, 05 Dec 2024 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733394783; x=1733999583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLjCmhyfXM5Xf2+HanMqUwO18jM/shPAxxCY/VZ9By0=;
        b=CrXZ4ineyAZAyk+jGz2qLQ/FLSbPHb5tpAsFBnwuImpfN9DbfQWS8XPaJDEfXAdAFC
         dFYMLfys5u+JDQI2fpWvcnI2gueRZTcBxHU87yobxxOnOpLK2FcNbx/E8KvX+8VEBloQ
         /ib+r8q8qK5LVMG34D7PnLgdRPf4LICTKq4cY74W0jbIICJ42SIvWOd8CVHQ/D7K6Rdi
         sUoI0sVXs2MN+IqR0JGWU47M/0Cd76CYcW78XBIDkFAs+Cm5m3d3w1UBv6cLGoleYTyG
         i5N8qY29+6l7E9l7jULlYLYs6Q1Sazd6/9vgk7y0rLJTdgLFM0BGQ5QNYvMXLOCzI1pZ
         TORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733394783; x=1733999583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLjCmhyfXM5Xf2+HanMqUwO18jM/shPAxxCY/VZ9By0=;
        b=aKzYL8TnuQmlSXfHK+LEDhmyLljXNrynccdqUX/ZOAjYZYXopaPaA0UReOyo+aVvfJ
         W69Ryyv4yWNUsvEKTi/ZViCNClDAtnHrRMMEAePmvWnWurW3jLSEfkhJTKrKJWlKeTYt
         SB9nAke/5Cj1dDTfGIf3JWa9Zk+S403lbnqcMt6QpoEdVr2gI+zoTKgyFaz2vO76Aikm
         sh7xSfA3gy9VXxkTrLMR9rgLf9trfBTgW353CC+TOpULvKuTa7hZeVeV6wfKDmeHO4e4
         4KAQlHk9spSjsfokl9wZANsYlyjC3lx3CNTLcDFxicHWlAdk7lnzb1RWFpVQSi8+k+ET
         +C/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW90DZCG8FSHSOCL/0uWPDaKO5jrYTuPCv04Ru4cCJV6v1w6iQoo1DplL0iB8f8CJdbEXWcg943WjA71hA=@lists.linux.dev, AJvYcCX3a0DBuQ6tQ2FzmeHfMNUH2rLzJRYDer3CvX/zNDYHqf5j5ORVj9StHv1dvG0bEphhuPXo6OiOdlqFZi9wVVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+x37iyNRdWlTVXePxGngq2+HL+igCQTlJe+8EAQW/IR+qJoka
	c/OBQ67uG/orb4wWJhnTMzQY/I8pRRvOHXXU9iww43Z2mXJpQ1n4
X-Gm-Gg: ASbGncst+oD9zXNGgGnjCKTldRvdvBVJ82aM6FV5oxxqQKARiorw5YLVRaf5AsDzf7p
	pjZ6Nd+pIS/oPq1ItZwVy9PGT8TFY0si8AVaLE1sAZ7gz+esv6tevSdxT/xL/vIy7ZvtHzecDtS
	fyLvs2LDf8bFglcbiSaA2N55BZLfD5/OIXs8/Az7zEokyC3tlxNrI9pE9I3bUGq+10QRjgVMWTm
	dRCsBmUBYmRnA8SvczMvEU+XItDX4c17iyU9JTqID94JYPmVOwOQ9upSVNRLcIc7+9aMDlA4kH7
	fal1PoRmZtWZvrSjBRqdeXo=
X-Google-Smtp-Source: AGHT+IGqxNFgJLgLNUkI25FRohVwCP0LMbXsdRKL304Scc05fSsjdWcesgSNUZ/hjUS5ftiLlA8Qjg==
X-Received: by 2002:a17:906:3ca2:b0:aa5:3c41:6e59 with SMTP id a640c23a62f3a-aa5f7ecd6abmr749576966b.45.1733394782750;
        Thu, 05 Dec 2024 02:33:02 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e179asm71783466b.179.2024.12.05.02.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:33:02 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 5 Dec 2024 11:33:00 +0100
To: Laura Nao <laura.nao@collabora.com>
Cc: ubizjak@gmail.com, alan.maguire@oracle.com, bpf@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@collabora.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
Message-ID: <Z1GBXHM1M4-Ws9Br@krava>
References: <20241115171712.427535-1-laura.nao@collabora.com>
 <20241204155305.444280-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204155305.444280-1-laura.nao@collabora.com>

On Wed, Dec 04, 2024 at 04:53:05PM +0100, Laura Nao wrote:
> On 11/15/24 18:17, Laura Nao wrote:
> > I managed to reproduce the issue locally and I've uploaded the vmlinux[1]
> > (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of the
> > modules[3] and its btf data[4] extracted with:
> > 
> > bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd_led_backlight.ko.raw
> > 
> > Looking again at the logs[5], I've noticed the following is reported:
> > 
> > [    0.415885] BPF: 	 type_id=115803 offset=177920 size=1152
> > [    0.416029] BPF:
> > [    0.416083] BPF: Invalid offset
> > [    0.416165] BPF:
> > 
> > There are two different definitions of rcu_data in '.data..percpu', one
> > is a struct and the other is an integer:
> > 
> > type_id=115801 offset=177920 size=1152 (VAR 'rcu_data')
> > type_id=115803 offset=177920 size=1152 (VAR 'rcu_data')
> > 
> > [115801] VAR 'rcu_data' type_id=115572, linkage=static
> > [115803] VAR 'rcu_data' type_id=1, linkage=static
> > 
> > [115572] STRUCT 'rcu_data' size=1152 vlen=69
> > [1] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64 encoding=(none)
> > 
> > I assume that's not expected, correct?
> > 
> > I'll dig a bit deeper and report back if I can find anything else.
> 
> I ran a bisection, and it appears the culprit commit is:
> https://lore.kernel.org/all/20241021080856.48746-2-ubizjak@gmail.com/

which tree are you using, I can't see this in linu-next ?

thanks,
jirka

> 
> Hi Uros, do you have any suggestions or insights on resolving this issue?
> 
> This problem is now impacting mainline as well. The full context can be 
> found at the beginning of this thread[1].
> 
> Thanks,
> 
> Laura
> 
> [1] https://lore.kernel.org/all/20241106160820.259829-1-laura.nao@collabora.com/
> 
> #regzbot introduced: 001217defd
> 
> 
