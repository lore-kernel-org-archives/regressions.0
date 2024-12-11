Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA5259498;
	Wed, 11 Dec 2024 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951430; cv=none; b=bgD8bcZVL9mvZwAtMaKwvM/YBIRTdW1+qjHWZHXlaeeIt7JdpG9bgbAQBf4h8FYROfqahcQViK9YSItork3YjAWFU9bbn8xUmS3LFis9usJY7OBUBri6AGP32C8eja07pSlwTrFYNdetvSXSkyfi0U5aq1BwNGxrBtmb3L99zjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951430; c=relaxed/simple;
	bh=OrSrCRThbnz38HRK4gbxPzXWxGq7zO/a92bWosVgsHM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy4VQsoWPVSda8egGq3L37TsTcn+74UjShCA51C2oUjCu3JUHXGb/5Q2191lhD1Yc6UaANXJZMxEM5FC+WBwp3IX05J/TPGSGJe6N2F74MbXOTFDQDzzltVtN1/FjK2uAmGTLZYZRxkQ5EXw/WrI0Xa82IVo2eEk5JxQU4/xdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN1LQL/J; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN1LQL/J"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso68675085e9.3;
        Wed, 11 Dec 2024 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733951427; x=1734556227; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZz00LLpT83ITUjYV+X2dbIbEBxGxb+OmoGdlRCf7RU=;
        b=aN1LQL/JehHHWVFAguCw0+zNqW5ZGMa/OeuSB7+N/rDcXkdw/jF6JqsFTF2TkOcF5n
         BJ0spEVjboSEF/V4Ek8E/zz+D9lg8ilso2sKKy6O3OC+Q+wsO2uHJgR4y7lPQgEV0oXA
         tgz9DIRl3YIjq3yUC+lz7O1KAI11UMYefnO0Ia/U6B0nkNYjL2bJAm5CgWQU4k2gZ+BQ
         bl2fnZn3accBor6SmDVMj09cnDDDlEZsmpAtKs/X3lDT+twNmldZoyt0zIzndLf1Q4qn
         FjPGgSC7bBQFPaeu0aI5pQLYD1KF2CP2MpV0QggxMR7kOU/sCW48vfQ941r+o8zaDdUN
         hUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951427; x=1734556227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZz00LLpT83ITUjYV+X2dbIbEBxGxb+OmoGdlRCf7RU=;
        b=RhpAcBVkWI5kcAbIrfdp3XAATFKNSY3DgOh/mZHQAiuY6cHCmDYXIUW055TXSDGn5x
         reTe4N32SgPW6YCECfmgWTrrFRkxuQOTsfgE+aFkVkO2WvWcqwrOuMKiYgujvNi/6Guc
         1Vy4zPL6YIOriQIr1ItLvLWOf4kdcWZ9Xa1jxQFb3mHj8ov0gVwOzL1DIdKEUq+49zfC
         SdsVHAYtqbbQH6ZHzzHR212k19ltMkA3OGixG/41+4yJtmyqM2oXhSo1hFzpTHEIE+5v
         +jkxxVpVCUgCm0bis4ksiRAszwiqssFfBbSoIQEzriS5NBTqej1DDI3j2NqansgvJkHL
         9dpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuTBysLecphwC32RtFenjTR7JmCgEiuKAMZGdKoJzJVhyZrUR2Bvg4QJE5/ToR9XfT4pjOObzdA3cEEihDsCw=@lists.linux.dev, AJvYcCXYjQI8/9MEw1aOHHhjqsTFCfZvce7P7d1Gzc7Bnd0snReICcsULyojEF60fiI66Wl+HECA8hYLEJMI2aI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMJJwAxm2PkwmchN1yCwxX4VLqs1u0T/aIR9kOB8EAUu04u83N
	F3JacJrjPTX1fK5d2G+08ubcfYs6DCOaPmilRyFC/pbLYx1GywJ6
X-Gm-Gg: ASbGncs0P0ibtpvDRnqOJzsWk2OLewLrAFVCKeG0pjy8euKdT15foxwCuLiZiFfi+B3
	J4xvv0eQf5FG/vxPwXUe+K+UnKnKIju0RY4pv2eBoQw/u/wXOty3371mfnf7WhUrKj/H5QtcoZo
	oaT921tatyqpxEBqoL4hffyBp1wEXVGa/akP4D98lqTxV1MeFOKAjZ9ZqgOzsdMqarlTSKlX42f
	k6cTe7iG78ofSjoCqKCLCc3mKRVf2BhlR+oTU5MeBOz3/G/j8RgN4rrulN0ApE=
X-Google-Smtp-Source: AGHT+IEoFF9lfFi/tcgC2R9iqPaNL1Un1IvsKyFFFNVGF8Q2i3Q3Ttd2SniT7E4tri3YhTDfR23Oqg==
X-Received: by 2002:a05:600c:4446:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4361c3723acmr35152305e9.13.1733951426556;
        Wed, 11 Dec 2024 13:10:26 -0800 (PST)
Received: from krava (85-193-35-130.rib.o2.cz. [85.193.35.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361e323828sm17329325e9.0.2024.12.11.13.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:10:26 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 11 Dec 2024 22:10:24 +0100
To: Laura Nao <laura.nao@collabora.com>
Cc: olsajiri@gmail.com, alan.maguire@oracle.com, bpf@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@collabora.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on
Message-ID: <Z1n_wGj0CGjh_gLP@krava>
References: <Z1LvfndLE1t1v995@krava>
 <20241210135501.251505-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210135501.251505-1-laura.nao@collabora.com>

On Tue, Dec 10, 2024 at 02:55:01PM +0100, Laura Nao wrote:
> Hi Jiri,
> 
> Thanks for the feedback!
> 
> On 12/6/24 13:35, Jiri Olsa wrote:
> > On Fri, Nov 15, 2024 at 06:17:12PM +0100, Laura Nao wrote:
> >> On 11/13/24 10:37, Laura Nao wrote:
> >>>
> >>> Currently, KernelCI only retains the bzImage, not the vmlinux
> >>> binary. The
> >>> bzImage can be downloaded from the same link mentioned above by
> >>> selecting
> >>> 'kernel' from the dropdown menu (modules can also be downloaded the
> >>> same
> >>> way). I’ll try to replicate the build on my end and share the
> >>> vmlinux
> >>> with DWARF data stripped for convenience.
> >>>
> >>
> >> I managed to reproduce the issue locally and I've uploaded the
> >> vmlinux[1]
> >> (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of
> >> the
> >> modules[3] and its btf data[4] extracted with:
> >>
> >> bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko >
> >> cros_kbd_led_backlight.ko.raw
> >>
> >> Looking again at the logs[5], I've noticed the following is reported:
> >>
> >> [    0.415885] BPF: 	 type_id=115803 offset=177920 size=1152
> >> [    0.416029] BPF:
> >> [    0.416083] BPF: Invalid offset
> >> [    0.416165] BPF:
> >>
> >> There are two different definitions of rcu_data in '.data..percpu',
> >> one
> >> is a struct and the other is an integer:
> >>
> >> type_id=115801 offset=177920 size=1152 (VAR 'rcu_data')
> >> type_id=115803 offset=177920 size=1152 (VAR 'rcu_data')
> >>
> >> [115801] VAR 'rcu_data' type_id=115572, linkage=static
> >> [115803] VAR 'rcu_data' type_id=1, linkage=static
> >>
> >> [115572] STRUCT 'rcu_data' size=1152 vlen=69
> >> [1] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64
> >> encoding=(none)
> >>
> >> I assume that's not expected, correct?
> > 
> > yes, that seems wrong.. but I can't reproduce with your config
> > together with pahole 1.24 .. could you try with latest one?
> 
> I just tested next-20241210 with the latest pahole version (1.28 from
> the master branch[1]), and the issue does not occur with this version
> (I can see only one instance of rcu_data in the BTF data, as expected).
> 
> I can confirm that the same kernel revision still exhibits the issue
> with pahole 1.24.
> 
> If helpful, I can also test versions between 1.24 and 1.28 to identify
> which ones work.

I managed to reproduce finally with gcc-12, but had to use pahole 1.25,
1.24 failed with unknown attribute

	[95096] VAR 'rcu_data' type_id=94868, linkage=static
	[95098] VAR 'rcu_data' type_id=4, linkage=static
	type_id=95096 offset=177088 size=1152 (VAR 'rcu_data')
	type_id=95098 offset=177088 size=1152 (VAR 'rcu_data')

will try to check what's going on

jirka
