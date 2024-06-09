Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6A13FF9
	for <regressions@lists.linux.dev>; Sun,  9 Jun 2024 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717950609; cv=none; b=Z09LitO5OH9BoPe5zVxiUThpbLREsUPyJil4SwMg6RFTtJCR4OKrkH8yZMpbzFIz9XCMdzEnTdZH59uoSE3GOs2FiR/IkcoLtj0N4tX4C2mHhqyYx25gTLRUxbAfkfy0kRnp7uekFV682nuimXFgqme10y6/nB8Z/eAwBfG5f0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717950609; c=relaxed/simple;
	bh=N66cO1s+WqUulUht0vyqX3t/6zdqQj9W39CF0jOCJkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuoYoigjcVxuNUrs63jib8JO1C3YdPacVw4ZdcjzYuDhEAdMdQdBbeb2Q+azLwvkzrE7dbGJOEn/JtYUHlyjLyHXHdTJpNc2IOiBRqZsbwpzexDatebwVioQN+D7aaj04JOPnZf4WA2I+YQnghf6Sijpo1XJkh0pEBot55rq2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKNY4H6m; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKNY4H6m"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7958e6d09bfso1079485a.0
        for <regressions@lists.linux.dev>; Sun, 09 Jun 2024 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717950606; x=1718555406; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TF7YavKalGLEiJlQ7xFhH0uBmMREnW8y1VUFULiv4I4=;
        b=aKNY4H6mY95ZVNR6/jYklFK2nCaLsYCs+eyYhCp9YVMg4npsYQXQCxF06Ar3AQeAvJ
         5YBlQ5mIT8zFPAUJ71iWUYe2TECA/bN91FDfb47G1qNMu5mdNZmLyyNWVZ9C9GTkrfnz
         CUtmaCfsAPemVtluQTjd0xpmgLAbY9bF2IVfEvBNBYB0CwJjf1dZ2SkRVPjRGxnzzy2z
         IS1FaFgg32Ql26ApbfQNExykn1g4Ye9xFnPsONZdN162in6Xh5XnadWok70l9dtjRxXh
         R+SswIyDcow/0C6H6AtGCfZ9GzRYx918bYui2hJ0bGgEj0VX2/279ZdHzn3TordJwa4l
         Lbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717950606; x=1718555406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TF7YavKalGLEiJlQ7xFhH0uBmMREnW8y1VUFULiv4I4=;
        b=Df2W8AoEBpsyqk0kq+ovLMpegli3DDNHZ0HtsJ5Ix73Mr3UykAMLZArOsV+6+5IrZ4
         LWXIy7DtJjMFEgkMdAwbpS4yXtfY8o74U0CqPihLtF6hjQ4OXzl+GFHC8/eeKEsNh0QV
         KblCw5hdoQCZOCV6ig4E0MAPSBnNtDMb/g0xfRy3ugNF5myBFFykPhqpP0hVIU52wToz
         TT0iwPRsSkhaR7BAyrcEe/OJhgVB9OGYKigOvi6OhivXLRQOCRSXw7au+GLN8ppVzaYW
         g2UtQ8C/HArRlEYBbT/0ZlyDEojVfaVZBf1AYJBbrJG9OtlpzNJEes1vv/uVUx2VJkK+
         OvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOAoJHV7n5w56sRdXGP/6K2VDAXW+e/SgUzdQl80W3t41uDVv6xaxP1t4+9pOdnAoWXXXtU3wWVAglSCwpnrIflgtTgGhoMjelnOU=
X-Gm-Message-State: AOJu0YzEWuouSeP8xnx5JKCA8r5hvZjsxb82urBhuHvJc5C9/9JNGVQm
	0mwO0I6BzhvlxkiTomWW6Gaa4//Ywpzjle94uF46wzjO0A1lYjkewWksmei8+Uc+6//V6szQ22Q
	7NMTQsexxpAXw9VeplOgKA9KohnA=
X-Google-Smtp-Source: AGHT+IG6BkY7CqMlCxmzceKgSHInDK6S4FTmtCyPQmGZpUdtneJNd79jnGzDxCtGBlO4b+mR8u2gnc0L/XA3QT45UJk=
X-Received: by 2002:a05:620a:2681:b0:793:325:d05d with SMTP id
 af79cd13be357-7953c182583mr810402785a.0.1717950605734; Sun, 09 Jun 2024
 09:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
 <ad69720e0ba720209cb04240fbc3c5ff059accbc.1717945321.git.pav@iki.fi>
In-Reply-To: <ad69720e0ba720209cb04240fbc3c5ff059accbc.1717945321.git.pav@iki.fi>
From: =?UTF-8?Q?Timo_Schr=C3=B6der?= <der.timosch@gmail.com>
Date: Sun, 9 Jun 2024 18:29:54 +0200
Message-ID: <CAGew7BvnxmmeoZqzETgCrSsVKU96tV+pe1DKn5r+QEsXguc1kw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: fix connection setup in l2cap_connect
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com, 
	regressions@leemhuis.info, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Pauli,

well done! This patch fixes the issue. Thank you.

Best regards,
Timo


Am So., 9. Juni 2024 um 17:06 Uhr schrieb Pauli Virtanen <pav@iki.fi>:
>
> The amp_id argument of l2cap_connect() was removed in
> commit 84a4bb6548a2 ("Bluetooth: HCI: Remove HCI_AMP support")
>
> It was always called with amp_id == 0, i.e. AMP_ID_BREDR == 0x00 (ie.
> non-AMP controller).  In the above commit, the code path for amp_id != 0
> was preserved, although it should have used the amp_id == 0 one.
>
> Restore the previous behavior of the non-AMP code path, to fix problems
> with L2CAP connections.
>
> Fixes: 84a4bb6548a2 ("Bluetooth: HCI: Remove HCI_AMP support")
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
>
> Notes:
>     v2: do the change in the actually right if branch
>
>     Tried proofreading the commit, and this part seemed suspicious.
>     Can you try if this fixes the problem?
>
>  net/bluetooth/l2cap_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index c49e0d4b3c0d..aed025734d04 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -4011,8 +4011,8 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>                                 status = L2CAP_CS_AUTHOR_PEND;
>                                 chan->ops->defer(chan);
>                         } else {
> -                               l2cap_state_change(chan, BT_CONNECT2);
> -                               result = L2CAP_CR_PEND;
> +                               l2cap_state_change(chan, BT_CONFIG);
> +                               result = L2CAP_CR_SUCCESS;
>                                 status = L2CAP_CS_NO_INFO;
>                         }
>                 } else {
> --
> 2.45.2
>
