Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D4287510
	for <regressions@lists.linux.dev>; Wed, 24 Sep 2025 21:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758749082; cv=none; b=NWrSLzu6xMYGmzFsiZ6N0W/O+Y81UAAuVWl6FE/Ex0BzWzwPhrus5WV7iNmg4PoYOxlmdYw06P5uDR3V6NplCLq4y1WxUOEKoUZCQIVWCFM2PKc3QGHuHiuDx+QJq0YHmRTQexZbJCo8xVvnXiRcc3liFpKhOXqKWU5YxDI+O7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758749082; c=relaxed/simple;
	bh=yYlJMEiOn4ahL9VGQHqHfLn8g81HGorNFwQNV25DIPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNne0CAkbnUGng92ZgGW3hhVFmuxI+ptHdrAzij2vwd1uDwmNOHwI/YhO/2QTVT6W2lGjmQdDsAsqiL4+Qf3TD5ZDqWyhVg8FDFwBi/aW0IWN6PJ6SP2h0vigH9SGBv/nG79QXvOxPFQzazYSapNv38NWcIPeyibokpubwdDToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KfbWVWnQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KfbWVWnQ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b556284db11so296463a12.0
        for <regressions@lists.linux.dev>; Wed, 24 Sep 2025 14:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758749080; x=1759353880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dhLUMSWCJCb7Nc7Lx/+68xlS8KMxySblqVYlmSCjYI=;
        b=KfbWVWnQ2RgUHsEz44O4lQTvbU6t8Bqoss0HTSTqi2AXbfzQHW7C5+S8SmLp+UnM9Y
         ZFNRx2T82ECc48kR5vvo3Olv8pJAhurQS8KhFcvbEDQgwxZ0uumcBD+uyE36HVJm6Jx+
         jaTOvy21J/zJ5CHRXGPyTU9rujboWmlwwx/NtjX1DGl9r05tAkjCL49+b6Peo1bAyAuB
         HFSp5gI96ezvDGSVEtzB0LEFah9ZeY2n9le1Da/xfic3p9WtICtqAuaPzaRznwONUbKl
         miJcUocgbR04fCr+Ao+s+XZnV6N7/FqgaBT8V5/hhgsjAE8i7KlgrygRJCj+YLt8Tstj
         +LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758749080; x=1759353880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dhLUMSWCJCb7Nc7Lx/+68xlS8KMxySblqVYlmSCjYI=;
        b=vK8Sj68nqMOCR8M5om/F3Wekb699EcFvCxmGnF3Jfqm16hoWh1kAclGWFB0uVZvt6n
         weLN7JhIA980XGz3Qq4JI682Zv7mHQJaByfrHfhZgRe3UHQMN80j9GGJEKnwDK75Rf1c
         7sBO/x/+KbGs6MtMPZA4cn1b8oGj8mQiKfgZ4VGMID/EB2vSuF6aTIf2FC6TAHl8Nn3B
         hFIFIzZY7Qq1YdH4WQSJe061LYoEnW81bcZ0YbmoVc6ZIfbhIIqbYl352/sHia66F9Sw
         8pwuMx0W/IIKVUw3BA/R22bI+WPlCtNxyfIX6JU3Qda5ErQvVn3LEfExMO/3TvVKQqcW
         C3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBnoY2r2jPbN6qUcGzaVuu4pV/S9UkEBqfq1kNqdGbKPh7MobA0QbeucO7BapZi42Tl2iO/v2hREAVXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW1oa1WZ42sJ5dhdZQjyiY5epfI0ZGlPj0Hw+UERkv2WC0TBOM
	MyJLQLR6fcNYssGI7+AIgLQ7ehmIlTXnKskmh+M3PJyCI1loPqDeQMv5GFqAulRCTIenXNGbAd6
	MJd4bU2kXPfDuLrZMatfy0dkX65JYml4RAbDfnNnD
X-Gm-Gg: ASbGncuOYOQ0igg7o+tNRPJLm+MWeqJt94dHn371Y8lF3XlyEr3sdW4pFfGD41kqk8J
	nNQPUBjEui4/DTnRett2ny7v33T3b9k1zyFksbtgMmpxfRfybvnhuD+KTH7VqZN0NvE+D6qRe0r
	M8C4C9p8CtnFI8xc4GtxHEs6oDqPKy10elp93NdFPepQnhV/5OnGRPulb3lHRZV70biU6K2zSa5
	HVZbTKXMNTdpnaZIQ==
X-Google-Smtp-Source: AGHT+IHR9pP1MvU0qJbfCGQoZkW8eEMjmqKvK5A67Eqc2Nnt+qxlyEAnQFYtUTxdfOJEIc9WV2+K5Q4lRtal6pKd1BM=
X-Received: by 2002:a17:90b:5343:b0:32d:17ce:49d5 with SMTP id
 98e67ed59e1d1-3342a2b08bcmr1001670a91.23.1758749080200; Wed, 24 Sep 2025
 14:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e5d594d0aee93da67a22a42d0e2b4e6e463ab894.camel@gmail.com>
In-Reply-To: <e5d594d0aee93da67a22a42d0e2b4e6e463ab894.camel@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 24 Sep 2025 17:24:28 -0400
X-Gm-Features: AS18NWCNQQSQBWtRenUjLlMUKvi01cd9ZXZW5J6vPc0TKqgJOAr2w5N1LESqTqk
Message-ID: <CAHC9VhRu=-J5xdKgYOJ1eqQ6EiMoEJ3M+cjDU8AHrts-=DoTvg@mail.gmail.com>
Subject: Re: [bug report] [regression?] bpf lsm breaks /proc/*/attr/current
 with security= on commandline
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 1:01=E2=80=AFPM Filip Hejsek <filip.hejsek@gmail.co=
m> wrote:
>
> Hello,
>
> TLDR: because of bpf lsm, putting security=3Dselinux on commandline
>       results in /proc/*/attr/current returning errors.
>
> When the legacy security=3D commandline option is used, the specified lsm
> is added to the end of the lsm list. For example, security=3Dapparmor
> results in the following order of security modules:
>
>    capability,landlock,lockdown,yama,bpf,apparmor
>
> In particular, the bpf lsm will be ordered before the chosen major lsm.
>
> This causes reads and writes of /proc/*/attr/current to fail, because
> the bpf hook overrides the apparmor/selinux hook.

What kernel are you using?  Things appear to work correctly on my
kernel that is tracking upstream (Fedora Rawhide + some unrelated
bits):

% uname -a
Linux dev-rawhide-1.lan 6.17.0-0.rc7.250923gd1ab3.57.1.secnext.fc44.x86_64 =
#1 SM
P PREEMPT_DYNAMIC Tue Sep 23 10:07:14 EDT 2025 x86_64 GNU/Linux
% cat /proc/cmdline
BOOT_IMAGE=3D(hd0,gpt4)/boot/vmlinuz-6.17.0-0.rc7.250923gd1ab3.57.1.secnext=
.fc44.x
86_64 root=3DUUID=3D285029fa-4431-45e9-af1b-298ab0caf16a ro console=3DttyS0=
 mitigation
s=3Doff security=3Dselinux
% cat /sys/kernel/security/lsm; echo ""
lockdown,capability,yama,selinux,bpf,landlock,ipe,ima,evm
% id -Z
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
% cat /proc/self/attr/current; echo ""
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023

I even ran it against the LSM initialization rework that has been
proposed, but has not yet been accepted/merged, and that worked the
same as above.

Is this a distro kernel with a lot of "special" patches which aren't
present upstream?

--=20
paul-moore.com
