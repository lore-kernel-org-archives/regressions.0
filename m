Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19311ABEDC
	for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006579; cv=none; b=I+UOEOrWvxbWJ2FLwsKizYLgPweP0w58BKhr594WoyUf87foksJcUBBI7IfIV1q2I5xnj8C8+TQ4zIN39YXw4Tb0qVopXD40oAmtAbVUPI3/8mO0KwVKXT305nT8EzBRsNe5fjLBySaXdEbtyvGSyupSbL4+mBzNtQxcIxwlJzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006579; c=relaxed/simple;
	bh=hHIg8i0gS3Bf6sinh0WN3XoEPUmj8P+7fJP2LdbCtG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFyXtatTiNp/LLpnVOo8qWnnoDYRaIbUSpwQpAXuAbEkvxnkqx5D/mkAsOkQw6x6YnMaxAo4bKIjmd4orYU/zPFCItHaHfqYqdA0I2LNormO8WomrT7GegSK3VP0ON5e5LJaVD+yF8vKGtx3QHLf++4cUyvvr5GugZQ/8aXikk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hapmNZym; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hapmNZym"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a9ae8fc076so282097285a.2
        for <regressions@lists.linux.dev>; Tue, 10 Sep 2024 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726006576; x=1726611376; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHIg8i0gS3Bf6sinh0WN3XoEPUmj8P+7fJP2LdbCtG0=;
        b=hapmNZymqD0PsCgDUx+wYrvbsbQfauN2GGPrR17z8JQip/J3hFsrKW0WpvkX/jVC48
         iimnVIkw159iZe3hCyOyG2aMEOstFt+hxqAQg7g6k+ooel4P811CAG9UkOrM7t0vdnfB
         qGoLqLA0xeE5F3htjXYi7rmEe37HITWYSdZ+Xv8PMajSMs2ODbZIQzdTySRFUQeyULvY
         UTzOR/OPlFcc5Xr2p+W5KAD33Ybecc4mu9QyiAcMRA3sUM1lxhvF3KqAEG34VxsScrNe
         a0rmZLfu82RquUSNUTq3ue8X/qohP0rVIS84JHmJM23iawH/KVm3QlDzevok9tIRff95
         pzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006576; x=1726611376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHIg8i0gS3Bf6sinh0WN3XoEPUmj8P+7fJP2LdbCtG0=;
        b=O/BnrvnIUaRbTOTV61aCDbIhLmMgRpaRC70rTE5uatoD3IPYckQOrzoPQBoJQyoICJ
         QGyIyCZ3vl59j2RJ7QOFaoo0Y0UA9V3uPoD5MU3ZG6kdaTz/PFM99ulGiWINWMIhaTk/
         D6/OSsW1+TVjiXiPGhkhWeMpJGoZYuMfbNg4oJ5tg2L79fVy32enguaLGRFW8jT+9mFp
         grxO2zYvtcKLzRvI7ejsb+92cEnwx6qQUzOZGerU+Bj5KEE2IzftewExd+7sr8FetS4c
         Vkm57NSMG7msD+jkuM5oNPOHTWjVIq8qrdD0k5J9yHZqHACbhbKhetRDs7GSlSo2eIde
         n8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtyxXvcEoPplDBfBGi5CBMLleGMX4RKfISwrwMyuU76oTQjuj+JR9tEOHuyHvJfLMEiM8bw+itu8O+bw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX282pRKWfSz0sldNzu2s7R8AgQWDzzLJWm8uqAbJEA/UmYPMT
	sZsinFjNqaJnroKW+cXE1ZuI/4VvVqcr5PtDE7FXoQdhG3+Oln2U2NW3Gj8vyuzWx5g9inHqZAe
	35yALV23s8QRFm2puK/zfgQBwV6U=
X-Google-Smtp-Source: AGHT+IH6j1CjcbCzXOH1/LDwJczOXPOc2Hu+rc7nUbxX9+q+uyt7yEQs7pN/cUoLVtxP6duCgszTtKHpKX9DYMGhazM=
X-Received: by 2002:a05:6214:3d08:b0:6c1:6b4c:6ba4 with SMTP id
 6a1803df08f44-6c5282fd494mr199592026d6.8.1726006576325; Tue, 10 Sep 2024
 15:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com> <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com> <CABXGCsMSTsBFW=OirDszPFVOiNgyOBSh3qyzAw-Coi-McnicAQ@mail.gmail.com>
 <04d3755d-f295-46d7-b35d-008b888b39ae@amd.com> <CABXGCsMDk59-P0Nr1v7KajKsoQh2966mykLPWQxajPtq=OGgXg@mail.gmail.com>
 <eeab54b4-c055-4992-9ca4-f9e382db68c4@amd.com> <6db472e4-cd90-4ba6-8368-725b10ba5b4a@amd.com>
In-Reply-To: <6db472e4-cd90-4ba6-8368-725b10ba5b4a@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 11 Sep 2024 03:16:05 +0500
Message-ID: <CABXGCsMaXUjHyySQqw7fPmoyDHSJ0yc0f6NPfOU2BRd_Hvj8TA@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 8:47=E2=80=AFPM Leo Li <sunpeng.li@amd.com> wrote:
>
> Thanks Mikhail, I think I know what's going on now.
>
> The `scale-monitor-framebuffer` experimental setting is what puts us down=
 the
> bad code path. It seems VRR has nothing to do with this issue, just setti=
ng
> `scale-monitor-framebuffer` is enough to reproduce.

I ran some additional tests:

1)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate']"
Symptoms: No

2)
$ gsettings set org.gnome.mutter experimental-features
"['scale-monitor-framebuffer']"
Symptoms: Screen flickers happening when moving cursor.

3)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate', 'scale-monitor-framebuffer']"
But Variable Refresh Rate is disabled in the display settings.
Symptoms: As previous - Screen flickers happening when moving cursor.

4)
$ gsettings set org.gnome.mutter experimental-features
"['variable-refresh-rate', 'scale-monitor-framebuffer']"
And Variable Refresh Rate is enabled in the display settings.
Symptoms: On Radeon 7900XTX hardware computer completely hangs without
any messages in kernel logs.

On Wed, Sep 11, 2024 at 2:11=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
> Hi Mikhail,
>
> Can you give this patch a try to see if it helps?
> https://gist.github.com/leeonadoh/3271e90ec95d768424c572c970ada743
>

Thanks, with this patch, the issue is not reproduced anymore.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

The only thing that worries me is the thought that the problem with
hang is now hidden.
It's one thing when the GPU hangs but the system continues to work,
another thing when the system hangs completely and even
Alt+SysRq+REISUB does not help to reboot the system. It shouldn't be
like this...

--=20
Best Regards,
Mike Gavrilov.
