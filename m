Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCA23BCF7
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 01:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786585585; cv=pass; b=nTn+SbyjA9Ryl4+c2TJPQKRvlI0ryspjcmLd0JPiz1a3pN9K+OjDN/8RbeVag/jx4VnZxbCCbPB4WIkE4+rqlpJAi8hpDVcbDeb/U4KoZzJx9vhwuKV+JRlpvPI73s356Fd48TbbsRrYL6tv3ZaJiI9IJHVHuZ/ZewJ51JdmtPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786585585; c=relaxed/simple;
	bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=g2hW5OsiBlrWrMPQ1k3RhzC97UXHe/yMoQrHKCmoMhMhXonKHS/sXLBKzp8utDgJ+HdI4/sJpgLJcAh1t972OGOHs+Bc/adm/TS5pa6uPRvzlVaQTFayv3XIojiGFs3qlLNMCSIFsACw/UWaY8YRfCjS5X+5Zj0N7UCL1IDiXqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5PpDpa4; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5PpDpa4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4994c49f588so4047125e9.0
        for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 18:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786585582; cv=none;
        d=google.com; s=arc-20260327;
        b=bw1ARryyqqL1mLoisEuIAhdd7HvGCqnyAWjf5g81s1mMPUwvFzdmkssRroh0NGiBze
         2Fo7s1KZnAy3/gkzHWEmi8DNdWb9wGQiZW+1Ey1ACnWsUSX6NrXs9YR60zK3DckrtQQm
         VbpsUVUPwd7swl5P8uYKmNPsvgQJIIJmWAq16cilH5qCtEnpr/F9uLFN9Qnc5jSHjNU+
         ids5I/ZtGSoCcCYLmNEVk6DJOhcS9jLbwQjYwUmcJrAlerJ3mI58jcff0qADFZwlhL1m
         317xOUeh03Oh9PKmjW1MMXHBWVDOcXripHIyLnOOcIiYeoakeBjRzbTVMV5rMaInJk/G
         Z3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
        fh=afq15lTum68b0GXlJOu5j87vf8a6peJICilNiymUpr0=;
        b=ovksZyfi1ILY9BUHkSxKvLG6X5//uP0Bo4SVBRTSlSJ795+DjrC/8NqsdirpX/Dgv6
         pzJzADmMWp3jrjj3U6+ERt6Slhx8ZbGiCiipuEYpM5exTmxaJZ4f5xx3kKkQHVcGCyWe
         4NXdLff/C6tHlhZ8gWvbqIFSOaCdJS1IY0A4g2KfgGhkqNDJgOoV9ZUMu97bWzQgW/je
         EZkm4FIfGn2jfSxiTG1IojQYQx6BaLQtqNaW3g0uZVfN5WH8YSZyYaXj+xVoMR0YVDAR
         p++zCSsohbnRvv4LdzT3++5MBo82vrdJZLfBRuaOlrXQYn//GuFS9j78dncsjnB17nQx
         WvGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786585582; x=1787190382; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
        b=K5PpDpa4DDlrvWMVUTFhEQaUI9WaIDnClFwvb/lO1zQv8mYjoWHjhoLZ5MNV/mN7lB
         SXAVp16baMZgL7+h+eNplvdwRLMzzcqRI5qi0JBG2Uu56FLVXyuf01b72U4LH0zqZz1u
         wuN9KuJ7lwslckzYl3uJYc23iLnkey47jhjlMt9t5ys4+Qw0yKlNk7ur4Mu6A3fk5Fwq
         5Y9mHr7ehci0hM/ginqXqfaetoMi7iLWdB/pqOYDKlZYF423CEoPAv7EAf2q1Tu+ChHa
         DRwraIX7IHeCTvhM+2GqrJ1r6RQQSBS0Y/NKNHaK/QR2OKSONgY6t3/Hbj3cliFMoEXu
         kgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786585582; x=1787190382;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
        b=gT5+JzMder6NxLQL25fPJqA46g7PO+Dh0F78fEFbJT9DsvoU8QM1IuDQMBuAIOOjJz
         8KBFpuxnJRXtoYfJ/DCe8GAaWuSjZObrADSkGcvtIcsLdcerrXkUR2GR1Icpl6OLQk1r
         Jee+QitNUa5bN09Y5uoxCm7xWHMtR2C+FCFI49nLr/LrUKqTAiyUT9VSp/Fz3g77JCtf
         a3vPb/pPtQji3xK0viqiGRP2S5ozOTcVa1gKfV5j4F+et4VJo5R4CmlYJ17DYbzuHH0p
         HoGJlT2FfLhEKTjWGX6iy8+kZskJKlY7luBg5VzpVe1lTgF0sxvo6D9MNtRJ4tlMwZRG
         omQw==
X-Gm-Message-State: AOJu0YxeBL/+WxW/nlqCOfxZHn/5BZutHcvumwGpzK28ZIacHn/N+It8
	8zpOlGp0lo8qK9J7lp9OArjhtmLwcNCQOovxjI/hfCDd56YnWFPA12F+fYIYtGK4O1Gs5AwXuTA
	3ZoynyGgJrqVRpxB+L3yYdLpPwAwCX7k=
X-Gm-Gg: AR+sD11kBOYjYA6lHS5PvW7N7w9RD5vMsjM1RT0lgG4j+82UyzgAGfwgCLCeWXOkhEx
	Lb8ZMSjgJmXa8Vfg0ipducrV8RDaCJwtH/MJLPfyxf8+g4/ktNGyTAn7qSEopIb4Wasf/FIIhlm
	qRRihzgf3R+rjiQCk8JQW4G2neTt+APXKkwNNBtbvChfJl9Glukn6rypLRvztDmQdLRaEeWpbA/
	xL7q4HV+FjjRToIFEwBweSpid1Gqsu3dYka6zu3judOmFj4bqnTVlz8+fXV6nhNSuhWhimP27D7
	U7bokuEUkix2vyHtS7MJ+8Dt//3X+ET/eVkLc06YkXqS
X-Received: by 2002:a05:600c:314f:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-499821fafebmr15881525e9.1.1786585581976; Wed, 12 Aug 2026
 18:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?5ZC05rab?= <rpwtsama@gmail.com>
Date: Thu, 13 Aug 2026 09:46:09 +0800
X-Gm-Features: AUfX_mwjykauUGRd7p0JKAKBT_PY18R1a8DeaIypAi_vxLHJDca3Oj2G0IKRXMo
Message-ID: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
Subject: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an Intel xe display regression on a Panther Lake
laptop. The problem started with Linux 7.1.6 and is still reproducible
with Linux 7.1.8.

System:

Laptop: Lenovo ThinkPad T14p Gen 4 (2026)
CPU: Intel Core Ultra 9 388H, Panther Lake
GPU: Intel integrated graphics, PCI ID 8086
Driver: xe
Display: internal eDP panel
Distribution: Arch Linux x86_64
Desktop: KDE Plasma on Wayland
Regression status:

Known good: 7.1.5-arch1-2
First known bad: 7.1.6-arch1-1
Latest tested bad: 7.1.8
The issue is fully reproducible with both 7.1.6 and 7.1.8. Downgrading
only the kernel to 7.1.5-arch1-2 makes the problem disappear.

Steps to reproduce:

Disconnect all external displays.
Cold boot the laptop.
The Lenovo firmware logo and systemd-boot menu are displayed normally.
Select the Arch Linux boot entry.
When the xe driver takes over from the firmware framebuffer, the
internal panel becomes completely black.
Close and reopen the laptop lid.
The internal panel starts working normally.
The issue occurs on every boot. Connecting an external display changes
the behavior and may allow the internal panel to initialize.

The failure coincides with the following kernel messages:

fbcon: xedrmfb (fb0) is primary device
xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device
Tests performed:

Adding xe.enable_psr=0 does not help.
Disabling my custom xe SR-IOV service and booting without creating any
VF does not help.
Linux 7.1.5-arch1-2 works with the same firmware and userspace.
Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.
I have not bisected the exact offending commit.
Full debug dmesg and system information are available in the linked
drm/xe issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902

#regzbot introduced: v7.1.5..v7.1.6

Regards,
rpwtsama
