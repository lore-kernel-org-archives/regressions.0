Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284824A07
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719796081; cv=none; b=PKUa+qYpqL5u3z4FY82oxTwWpU4zGb/vxaxuO5Oo6c6UEyvhv1uWWZLqE5BhZTl8lXwZxfjz6SAlAxuZrkKQpBMmrtOzxHTVDqKM6idK7uaASH5fho1WTIC9QRL6t/sAC4+fqFL0iYHThjop5RB7E9C5tOj/D+6OwFMH97Wnr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719796081; c=relaxed/simple;
	bh=PHUvxpDXIjis6Is2UhneQS2IrOMOZyp0ltUMTOoofLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5UIHuB8UimV5jjDJgyJE2eOGiklq+PSjFwsV391ZWRXRAuyysVmrseFZOE1vhtILD3huY/mrf4eF5U2J3C0oIZU6Irr8RGQZNEcIQh4l4zq/lESO8nVDfMl22445C8ok5gLagEAGowSxrOzFIwc5rLTKB0qLC0w/F4W62tBENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg+WYZHu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg+WYZHu"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79c11e92afaso162553185a.2
        for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 18:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719796079; x=1720400879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHUvxpDXIjis6Is2UhneQS2IrOMOZyp0ltUMTOoofLs=;
        b=Kg+WYZHuSLbi6+rOPhdew44OTZI6fxzJkuOSuxxwkxQGMllW26gvTSnifzgkbwRSyk
         ACTY8O+pXWeTQZO6TZPgnk5cuV+oNQPYf3DeJKxJ7BeQF0RefRSveNCUpN5Q6BKQX1G8
         2DnMqqQAXZ+UiDtGzBd1G8EDtZ/qJc45gyI8yrDEu6zs+usbXaInwJDVp3C0MSL/VnXn
         tbC8XkN0g1EX9sztRH0LC6WmrBv1fBGATss87SUx3FvniZLohvxQDcSfAAhtyNNeroKN
         BFPGySEx1gq0aqLA9dxc1/Qx3KW7ZbjmyrO4jCoXjjwdKCFzMVPPboDf7qnt4/U5EDEe
         KsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719796079; x=1720400879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHUvxpDXIjis6Is2UhneQS2IrOMOZyp0ltUMTOoofLs=;
        b=MEzqxaMVakImNAKAJpUjU+OoicpjXi21BtmDnQoEgfVru9f8GdD1i7JQhbTJlZWx5g
         dOz5gWubLwjtOxTJz71Ohvvw9NMhVx5jhrdjjiwZLIT09dTKCOT9gIQ3S0tLg2HaLStN
         hX96O+3qDxgzv9jszx7EfoYTBxvIstAIg9trTpQGlU65YAJL9RNYPw4ISk29T756CdDn
         dZ11YZejsBpGZoclCVYdQ2mWCJBBb1XrCMfXnOMvmVh/7bGbqeWb2Soo/PSpBn81MjbZ
         qAwepTqd7yLGJhoVoLCKR6M2oHRH0jTRDFQYQCLP5wCZ66srXh7askTpsJ582sbqPQc4
         zn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoNRxcb96VjIBYBfvQefr9yxev9dOCzA8gM2Z/vfQQ30DAz5B3Dtyphw48x/D4Nikn5aurbZk/jkyT0DmlbFLjDsZI8L+Yes2PdeU=
X-Gm-Message-State: AOJu0YxwC3+qChy2gOPVgHIWxdfyH6kZinWsYzSrEWFqBJGiQzFMvH2m
	pYF8YVKFtQL+28H7oYL+3ffrO7VMliBamAQTkWhzKfhFvfBajQDFs3B17Zz10VDT7lX27vLV1Z/
	8LMw0hCtZNuNyAaZC48yPnoGSYx4=
X-Google-Smtp-Source: AGHT+IGrnxli0UKEw+A5n5Tk+KgLEhWimAl8csj74cXkOOm79lnGgeWqM/jV3TMfXoVZJO+HhcKXP7gTIPCliQiJ55E=
X-Received: by 2002:a05:6214:d09:b0:6b0:76f1:8639 with SMTP id
 6a1803df08f44-6b5b7161b24mr56862386d6.42.1719796078680; Sun, 30 Jun 2024
 18:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
In-Reply-To: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 30 Jun 2024 18:07:47 -0700
Message-ID: <CAKEwX=NkWzyhb6dZeV1=sGKwurwhk7wMcH_RtwJ9ztgABjMyfQ@mail.gmail.com>
Subject: Re: zswap_writeback_entry crashes in 6.9.5
To: Pedro Falcato <pedro.falcato@gmail.com>
Cc: mm <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 10:58=E2=80=AFAM Pedro Falcato <pedro.falcato@gmail=
.com> wrote:
>
> Hi everyone,

Hi Pedro,

Thanks for the bug report! Taking a look now - some preliminary
questions to narrow down the suspects and aid the debugging process:

a) Do you observe this bug in 6.8? 6.10?

b) Have you run the faddr2line script to verify that the line that
triggers the crash is count_objcg_event(entry->objcg, ZSWPWB);?

c) Do you have a full dmesg log? Or maybe some other reproduction instructi=
ons?

If entry->objcg is garbage, then this smells like a lifetime/reference
counting issue. Either:

a) The zswap entry itself is garbage. Not impossible, but seems
unlikely. In 6.9, we effectively isolate the entry first through the
swap cache, then check and remove it from the zswap tree (under the
tree's lock). The former locks out concurrent accessors, and the
latter should have taken care of invalidated entries (and prevents
future invalidation attempts). Furthermore, after this, if the entry
is somehow garbage (i.e freed and recycled), it should also be
possible to blow up in the decompression step first, by feeding a
garbage handle to zsmalloc and crashing the kernel at that point. IOW,
we should also see zsmalloc crashes in addition to this particular
crash, no? I cannot think of any protection mechanism that applies to
the decompression step and not to count_objcg_event().

b) entry->objcg has been freed/recycled under us. This is much
trickier, as the culprit could be any holder of the objcg reference
who accidentally double-released the reference it held. That said, if
it only happened on zswap shrinker path, then maybe there is something
to this...

Let me muse on this a bit more. Please let us know if you have other
clues, traces, hints, or observation - it will help the investigation
a lot!
