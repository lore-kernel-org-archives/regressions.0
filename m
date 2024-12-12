Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2BB20E6E1;
	Thu, 12 Dec 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995357; cv=none; b=GoeorydF0PR+EW7/RHQ6WRsYnrO8TCgHZfjjEvOtcKW/WK6K8vqCZaAfFtoWC8v6TeXMHhIfhdnlT1bKMozkQQzaK98sSWeHvTm8rrXH1IfWsU5r7fNLGPhY13P1wNnF6GjDLc3GgCFPqRqPdZI8/btgB6yCl0tUaRAUScjSDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995357; c=relaxed/simple;
	bh=MH76A8RrBVeEauyXdzge4bB1tbBOOSK8hzAcOTLGZu4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhcQn/8P7jj8nvhSyvABZFgkMMmle5q2H2TqFCu9NIht9tH1qYU32DixrMzeTShVmi7mN+wbWS7wJjmpm/04Tue3tgIAtIY6YMIHIiY2cvq4xCNfpzLG14iLJ2B9mqpW9wqQGPgKSbgAsT2LTWTZzKIgxgBaAgRwPfwzCXqvbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK3KV0q6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK3KV0q6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43622267b2eso3754125e9.0;
        Thu, 12 Dec 2024 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733995353; x=1734600153; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/8qAprzepzOhI9hq4ABjT0H5BvreqQl8xCmHayUS8c=;
        b=cK3KV0q6GckXsol6rWcOOxrEl9rsuYnumOuVhnfQPMI7X4d55yXPTsWDEvRCTz9UHw
         r6uL3Ix5CRlEjJKpE4dfLi1LAp3tVZGhuGVJnOlf1oeyYCNGqjr779FaJY7Yx0tWAKhq
         SdEpRdoL99bkFPVdiKc8smElz84i/yYz1KiGdO2fhAIw+6yghYhuET0VQe3eB3vBORTK
         kokoGpQleX15GcPPM8YdWokFJX3hZWtRpf93lH0y6/gOYPvKknvlXcraM15zRuH1ytlq
         Pq0aKesfuSa0/S7BrjFdkEEUxN67mKGz91q/f2JQhjMooZE1mMwx06SjE3jLBMjCo+VC
         e7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733995353; x=1734600153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/8qAprzepzOhI9hq4ABjT0H5BvreqQl8xCmHayUS8c=;
        b=PaBiluCSUHQcKr3r9jsApnWysE0dZIbMG7O0YBZpmRZQsktFD6PW82I1OmjYMNggjR
         44FFKO52BvruyBDGxiWUag8sHlAfF3kvo8hzQmg/lYKVoNhSoFWyd1lngH2Wec/BO6gy
         cC8HPFhYSMJ53iUHYH2sjE+v8ohhtpeTBEt2jPg4P4IO+zaSZ6Ou2KQbthJ77gZgrKFv
         T8N7hysrQsDCPm65DVM84E/43ISEuK0XLBRK+EEUkZGClRvG9S1q77yBwm2ph/z8qP4B
         R6OYhCAkr+NDtWWbkS1sz652X2sg84WW/N5O1JN0sMvm9t0CRBTlGm/4z77L9IABhiQe
         0wiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJA1iL9rAVqYmJe39TTgBwdrQTOc9H6M/WIaLQborHbqBxLCbgIbKL8ZL3IRW71a6iXYJARAI7wiRk21s=@lists.linux.dev, AJvYcCX//56YwJuBOAD6g/A6gKEgJMWXpHINHDx6haYzzhVY+ZNC83NRBJZTk7Z4QSa6yTi8ZTXF1K4O2Ie/6PblPUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVHvNaR0nkq/McZNqbTYmukZNp1E/87M7Pi/ql14m8QdLwtu/u
	36DSo2wB10ONuFawTKBTuGYCAxawjy+hdezPVUHroRrc889ZNu8T
X-Gm-Gg: ASbGncvh1cEWXcewLw3LcZeEvd4PTxaA4WhyW3Rt+1Sjc9ugriMPW2cHVzsBBtU6w+4
	H622Z5N5QWjX1z3jWL9YeCmv/LynFuC02V+7Qmn0KCGZL7HEisGErsCv9aCdJ0lEP8dJX8oWQf3
	KcZ1ruzHY+lxB1ZXQ8IRNXtUPIP/1sIc4B8eT519a1MQ1ITppUPEWGwN9Umwy1UXzWO6WaQY9Kq
	xF0m1kUt9qylTm6GEapTqSZnNQUT9WMI9C4XVeJKvuGIlvFvAcTVkWpjwZ9+P2GXr5hgkJB5RCj
	cMlBlJ6vyeVVQEl/qB8SCoChXFEuXw==
X-Google-Smtp-Source: AGHT+IF5BcgvSTVBRtoBdBseMDIWG1i+t5YhY/Nf3IWtocZuQeNr3CTNju1EKFip3g+LBHDjf7c81A==
X-Received: by 2002:a05:600c:4e4b:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-4361c35cc4bmr46472845e9.9.1733995353163;
        Thu, 12 Dec 2024 01:22:33 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625717c9fsm10563025e9.44.2024.12.12.01.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:22:32 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Dec 2024 10:22:30 +0100
To: Jiri Olsa <olsajiri@gmail.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Laura Nao <laura.nao@collabora.com>, alan.maguire@oracle.com,
	bpf@vger.kernel.org, chrome-platform@lists.linux.dev,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on
Message-ID: <Z1qrVu2Pv6qXI9tD@krava>
References: <Z1LvfndLE1t1v995@krava>
 <20241210135501.251505-1-laura.nao@collabora.com>
 <Z1n_wGj0CGjh_gLP@krava>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1n_wGj0CGjh_gLP@krava>

On Wed, Dec 11, 2024 at 10:10:24PM +0100, Jiri Olsa wrote:
> On Tue, Dec 10, 2024 at 02:55:01PM +0100, Laura Nao wrote:
> > Hi Jiri,
> > 
> > Thanks for the feedback!
> > 
> > On 12/6/24 13:35, Jiri Olsa wrote:
> > > On Fri, Nov 15, 2024 at 06:17:12PM +0100, Laura Nao wrote:
> > >> On 11/13/24 10:37, Laura Nao wrote:
> > >>>
> > >>> Currently, KernelCI only retains the bzImage, not the vmlinux
> > >>> binary. The
> > >>> bzImage can be downloaded from the same link mentioned above by
> > >>> selecting
> > >>> 'kernel' from the dropdown menu (modules can also be downloaded the
> > >>> same
> > >>> way). I’ll try to replicate the build on my end and share the
> > >>> vmlinux
> > >>> with DWARF data stripped for convenience.
> > >>>
> > >>
> > >> I managed to reproduce the issue locally and I've uploaded the
> > >> vmlinux[1]
> > >> (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of
> > >> the
> > >> modules[3] and its btf data[4] extracted with:
> > >>
> > >> bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko >
> > >> cros_kbd_led_backlight.ko.raw
> > >>
> > >> Looking again at the logs[5], I've noticed the following is reported:
> > >>
> > >> [    0.415885] BPF: 	 type_id=115803 offset=177920 size=1152
> > >> [    0.416029] BPF:
> > >> [    0.416083] BPF: Invalid offset
> > >> [    0.416165] BPF:
> > >>
> > >> There are two different definitions of rcu_data in '.data..percpu',
> > >> one
> > >> is a struct and the other is an integer:
> > >>
> > >> type_id=115801 offset=177920 size=1152 (VAR 'rcu_data')
> > >> type_id=115803 offset=177920 size=1152 (VAR 'rcu_data')
> > >>
> > >> [115801] VAR 'rcu_data' type_id=115572, linkage=static
> > >> [115803] VAR 'rcu_data' type_id=1, linkage=static
> > >>
> > >> [115572] STRUCT 'rcu_data' size=1152 vlen=69
> > >> [1] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64
> > >> encoding=(none)
> > >>
> > >> I assume that's not expected, correct?
> > > 
> > > yes, that seems wrong.. but I can't reproduce with your config
> > > together with pahole 1.24 .. could you try with latest one?
> > 
> > I just tested next-20241210 with the latest pahole version (1.28 from
> > the master branch[1]), and the issue does not occur with this version
> > (I can see only one instance of rcu_data in the BTF data, as expected).
> > 
> > I can confirm that the same kernel revision still exhibits the issue
> > with pahole 1.24.
> > 
> > If helpful, I can also test versions between 1.24 and 1.28 to identify
> > which ones work.
> 
> I managed to reproduce finally with gcc-12, but had to use pahole 1.25,
> 1.24 failed with unknown attribute
> 
> 	[95096] VAR 'rcu_data' type_id=94868, linkage=static
> 	[95098] VAR 'rcu_data' type_id=4, linkage=static
> 	type_id=95096 offset=177088 size=1152 (VAR 'rcu_data')
> 	type_id=95098 offset=177088 size=1152 (VAR 'rcu_data')

so for me the difference seems to be using gcc-12 and this commit in linux tree:
  dabddd687c9e percpu: cast percpu pointer in PERCPU_PTR() via unsigned long

which adds extra __pcpu_ptr variable into dwarf, and it has the same
address as the per cpu variable and that confuses pahole

it ends up with adding per cpu variable twice.. one with real type
(type_id=94868) and the other with unsigned long type (type_id=4)

however this got fixed in pahole 1.28 commit:
  47dcb534e253 btf_encoder: Stop indexing symbols for VARs

which filters out __pcpu_ptr variable completely, adding Stephen to the loop

with gcc-14 the __pcpu_ptr variable has VSCOPE_OPTIMIZED scope, so it won't
get into btf even without above pahole fix

I suggest gcc/pahole upgrade ;-)

thanks,
jirka
