Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1651D54C5
	for <regressions@lists.linux.dev>; Mon, 28 Oct 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114123; cv=none; b=m87KmVNRDrMNmbeBf4CNOCYjq/5CHPwfAnjbKCdyagdBi+ELeystH9X/TcZbGaHWCX+fS+uRkYpiV6iZ0zoPzrHGoBpjX91vhZy6z7f0tbJLcY0QNR1skadW+tlv9YXzZ/zeE5nh/EiU3NGCi4EBfO8XFvRCiN6JaaIPgYb6+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114123; c=relaxed/simple;
	bh=o40vLJF3BhZaPEsLLLDudzK2h1sDZMe+2JjzMNY6nBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CymPYh/ObjBtO+PyXX3TJJuCH9O1DWuB5M64HNFX3EfJpI9H1/yZR7d0S34/tve36BGxVvJIj23d6mp8uEss7z6mzF47bq/i1iI4wE3imcWZaf6o5fuc0Sw0iVEs5wpXJ0C6GUKeV6CRE5Z+iysDG+Od+UWrmHQaWjXfGEl/bTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd37F/n4; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd37F/n4"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-83aba237c03so138310339f.3
        for <regressions@lists.linux.dev>; Mon, 28 Oct 2024 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730114121; x=1730718921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o40vLJF3BhZaPEsLLLDudzK2h1sDZMe+2JjzMNY6nBU=;
        b=kd37F/n48lXUWqK3DkQ8JPQHtBp9qf2oMatAaacdkDReG+QCuqZZQaIp45rQ2BoVVB
         Qe19ti47V3mGn44AXD+6Ij0yfT2OU56s78eYShMeCMu1oDZVIHp6jpwVgRB8x1trUPes
         +BzNh5hYEgQCtsQjTZUE7zlrpsXfDQCaswqFF124TfTHXLReG+zmNkeVH1Ejlk7HZyuO
         FXT6NrtoYGmY3Wyvlbv+5alQMg4D95T0qgDWPSE1Tx0jLUWOEVToO5tnAVDdEWmSfLLq
         6xEnJWHcWdirXJSj9IKvUFnahcfxI7GCqA7f+/EbIDOBqPW+Am4frQ1R3g2ACpgU3QE1
         dWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114121; x=1730718921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o40vLJF3BhZaPEsLLLDudzK2h1sDZMe+2JjzMNY6nBU=;
        b=HkK4E24BitZzPRbpc856BqmteF2gJqcDsNFUQkm1TJfETSWc9lrh9I0ZxVgGkQx8yx
         t3RRfdaHE2+WqjKdhtg11ZlGcOjTfZGhP/E9G97UxTk5T1bwO1D+zwvzpJUzyymgvU0E
         qpR1qNo6c90M3PD7kC2rIFGU6pV0uSvaNvkkTOrdXpwgOXE0I61RW2OdytO81MDObUhd
         KJNtFslf89hi5RlNxMAdmaEdN86FATlYu/oeRleVZoeHBILWP8VgzPyvjtU8wXaqmu2y
         1t3sVZ5zttj1yOS5HQ+8pDo6uZWmG0Lv7D6oMkd4zx4IltbiMxj7TM+Dq6qpKLyrqizB
         87qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQeGZeHVJccwPZPlVxVj+Ora8gy1FA/CTK95fSPGpZPLGsi3R0dRvQ5ODvh1mTDxDraixSyzMJ1cJbFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpS1ooPzGhtDecsZqse85PI91LdBP0jxnsigZNfg0cwmct3LIB
	jZblm8jiBRYiTiv8M+lU+elfU3alB8OlfAbgSVA+YIMdSYc9memJZcloNNHwb/yi0lDdBNzQtEQ
	SGruLdpYr5Q1unCqU7FxsDuKng/54FzAP
X-Google-Smtp-Source: AGHT+IGLdmWh31jtT64TtCjVtFG4zpYJXxVdqe86MxZJhnLUBdxBzPK009ielBNty80zQFy5wKN4MMegA9wKklLCdrA=
X-Received: by 2002:a05:6602:641c:b0:83a:a8c6:21ad with SMTP id
 ca18e2360f4ac-83b1c41a25amr618176139f.7.1730114121119; Mon, 28 Oct 2024
 04:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rui Ueyama <rui314@gmail.com>
Date: Mon, 28 Oct 2024 20:15:09 +0900
Message-ID: <CACKH++YAtEMYu2nTLUyfmxZoGO37fqogKMDkBpddmNaz5HE6ng@mail.gmail.com>
Subject: [REGRESSION] mold linker depends on ETXTBSY, but open(2) no longer
 returns it
To: stable@vger.kernel.org
Cc: brauner@kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm the creator and the maintainer of the mold linker
(https://github.com/rui314/mold). Recently, we discovered that mold
started causing process crashes in certain situations due to a change
in the Linux kernel. Here are the details:

- In general, overwriting an existing file is much faster than
creating an empty file and writing to it on Linux, so mold attempts to
reuse an existing executable file if it exists.

- If a program is running, opening the executable file for writing
previously failed with ETXTBSY. If that happens, mold falls back to
creating a new file.

- However, the Linux kernel recently changed the behavior so that
writing to an executable file is now always permitted
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D2a010c412853).
That caused mold to write to an executable file even if there's a
process running that file. Since changes to mmap'ed files are
immediately visible to other processes, any processes running that
file would almost certainly crash in a very mysterious way.
Identifying the cause of these random crashes took us a few days.

Rejecting writes to an executable file that is currently running is a
well-known behavior, and Linux had operated that way for a very long
time. So, I don=E2=80=99t believe relying on this behavior was our mistake;
rather, I see this as a regression in the Linux kernel.

Here is a bug report to the mold linker:
https://github.com/rui314/mold/issues/1361

#regzbot introduced: 2a010c41285345da60cece35575b4e0af7e7bf44
