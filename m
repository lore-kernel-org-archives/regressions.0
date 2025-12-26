Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B21DFDB8
	for <regressions@lists.linux.dev>; Fri, 26 Dec 2025 05:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766727472; cv=none; b=hhtzKDqAKVSV7FcxIimjBgvIOoOi8x/7Ee9hB5MXAW4AF4v8wV58TgbCzftSi9JIUr0/naSlqrZGBKCX8QY30zslGb1PoSJvGCr+RS0qb9zZ9mVzg9ZOTIByITquGtwLvc70IKBT49dnmv19pnuj0jgYwfnpuaLvynS2/8pZyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766727472; c=relaxed/simple;
	bh=CNfjI1T1+B23dZV3+u5LqFMovbJwrjQnRfDKEwasWwU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WxZI+KroqnCFpmK4Ub1ifkIiV1Nosq4W+Ru906YX03phUnbuvSBzHFuebzc+zavQ3f7ElVI858ngn2s2KXW6J6wN6HZIoYh0kZEU5F9PlNe8seMX72ujiioXTE0UhGoOaY90dQLNkrl+yP3PggJAXfrx7DvNVwMEaZUTYzJcR9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULW9avMo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULW9avMo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a110548cdeso97267425ad.0
        for <regressions@lists.linux.dev>; Thu, 25 Dec 2025 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766727469; x=1767332269; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNfjI1T1+B23dZV3+u5LqFMovbJwrjQnRfDKEwasWwU=;
        b=ULW9avMoOSi4FqnFuWILpSB9PXkQzHn2RJUoaP3zb8kLlCFeS37KnGS2v0NXeMMY0z
         ESnLxzkuozMLZ7FpcZczv2T08ezS6T6CgD4X2L8cv5WiXru4a4cuMneLQZ9yvdejcvB1
         NwhWofs2vQLa68Duwc+3wQAgNnFnQ7PcO59la8uE4Grv1+nBG1MaMG9OMSnFS7cNM9ZK
         jgsX9bQi+DlAxef6P3eJpq41dPki52aMUZfdtDZc8jEb7GaPV9Ck5QxGaRjyOIIse+WH
         XYW0I1JfP2ZlhZeZD22e2qR5r+NDPucJKltEtz7NyB/YQ/vsriKMCGStHoSSok5gQi/Z
         7Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766727469; x=1767332269;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNfjI1T1+B23dZV3+u5LqFMovbJwrjQnRfDKEwasWwU=;
        b=pI2fr2OD7fAGp362Voc8jBAKtgnR8NKh4oX4f9dMVtw6Su6H45JRj8iRlaR9l/zRs3
         XpZ0YS+6yrTEt9KRVrb6HM3tAYDXLW9qXeT/y755IdRYoF6yiP1yHFO/DUqrAzsPtEMK
         ocA9h7s5nGXlR/mplla1qQKXAlFv5SXtheYzG9xD4vNylerrsxA4Tqs+HgCL7b+PtNKx
         oYc328fcGb/abY8NTKdQD5U3a0lu3rPGKpNfapF+3rUnJVeQCpRZwrzqv/QKcmyC8jIK
         /tJQWPkQN9VJRzH8s5d+YRwSxIHr84WZvWs8CncZPRXiOp8Rd/ZBbj8mOsZjNy1n5FTZ
         t7+g==
X-Forwarded-Encrypted: i=1; AJvYcCUllKkiUVBhq6ISD4QX7kuywCYeFJYvnCUIqZAmJTm2tDpGf1ccL85dwlM16A9azaNZgJu4igosurQtQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRJJs3coWvPigdWeHzx/+7b82SmjIEslYFxGjV28O9M8o05cUS
	jhLpa/kY5snDcbWZMuJVBFnw65vupUFADx636402SdDokdpOvxcVGct6acfd4OHCgCz28B0M7Eb
	H818xZ1sCDSYfmDYHkokJiURxPNxdgwQ=
X-Gm-Gg: AY/fxX5pibed8y3VG0RrALNKZspNdvKhvAYaEdnXr0sWsBY3VjpEE1k70mjzFO1F/8p
	kL7jsfa4RWsiomqpAq00h9f4aqgtbdM9+QJ94Bjpf3xpkrReCXBlUxlvf+tTeZKryZi9Ee+lFGH
	4oC49EfoQnlhhkPO5N6ZOUxd7n03I8OKGRDZ7br0MrQ6ZqjUOIqjCmuZ0ZhBiNwNoObvOB5c3Bs
	DZzE9j21t/KARja/HLH6LVK5zd8LU7ag0YDHl9ghnfBv0toVbJ6cdKmYUeCSh41+3oMDSOwjsVE
	YF4JkXy7iNyvNZ2+3Bc=
X-Google-Smtp-Source: AGHT+IFHmB3KAtgnAFZEBLxVZw8dua5doOOkhyb8dga0r6/LbV83FGc+6ZMMGYXDisl2Q9jYYm/7PROAUjWhG9ZCnvo=
X-Received: by 2002:a17:903:18b:b0:295:fc0:5a32 with SMTP id
 d9443c01a7336-2a2f221284fmr227033725ad.3.1766727469576; Thu, 25 Dec 2025
 21:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Fri, 26 Dec 2025 13:37:38 +0800
X-Gm-Features: AQt7F2pMD-yyutgxIcP81xrEnfriCzQVdNO_izI04YscekyKSdJbpbOdUCutT6k
Message-ID: <CAK+ZN9qttsFDu6h1FoqGadXjMx1QXqPMoYQ=6O9RY4SxVTvKng@mail.gmail.com>
Subject: [BUG] net/sunrpc/auth_gss: Memory leak in gssx_dec_status/gssx_dec_buffer
To: stable@vger.kernel.org
Cc: linux-nfs@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

A potential memory leak exists in the gssx_dec_status function (in
net/sunrpc/auth_gss/gss_rpc_xdr.c) and its dependent gssx_dec_buffer
function. The leak occurs when gssx_dec_buffer allocates memory via
kmemdup for gssx_buffer fields, but the allocated memory is not freed
in error paths of the chained decoding process in gssx_dec_status.

The gssx_dec_buffer function allocates memory using kmemdup when
buf->data is NULL (to store decoded XDR buffer data). This allocation
is not paired with a release mechanism in case of subsequent decoding
failures.
gssx_dec_status sequentially decodes multiple gssx_buffer fields
(e.g., mech, major_status_string, minor_status_string, server_ctx) by
calling gssx_dec_buffer. If a later decoding step fails (e.g.,
gssx_dec_buffer returns -ENOSPC or -ENOMEM), the function immediately
returns the error without freeing the memory allocated for earlier
gssx_buffer fields. This results in persistent kernel memory leaks.

This memory allocation is conditional. I traced upward through the
callers gssx_dec_status and found that it is ultimately invoked by the
interface gssx_dec_accept_sec_context. Although I have not identified
the specific code execution path that triggers this memory leak, I
believe this coding pattern is highly prone to causing confusion
between callers and callees, which in turn leads to memory leaks.

Relevant code links:
https://github.com/torvalds/linux/blob/ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1/net/sunrpc/auth_gss/gss_rpc_xdr.c#L84-L92
https://github.com/torvalds/linux/blob/ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1/net/sunrpc/auth_gss/gss_rpc_xdr.c#L304-L347

I have searched Bugzilla, lore.kernel.org, and client.linux-nfs.org,
but no related issues were found.
