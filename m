Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CF62DC79A
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129333; cv=none; b=cfifyQgV0NSFO0WRtQv+wvN+ouSLP2DF4YifZpAv9ACL3TVvZX6n5cuYv2bzLTCM+K4vn1NKYSqUgHncJXgDBZ9Y0eq/9aEBIhJP8MdheWCIcuXpWD3gPhsX0Pl3+NBVAYeTZzHfwcrF3yPLrGV0YGelZ7UB3ijwjANcn3pDVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129333; c=relaxed/simple;
	bh=PrVUMGsRNDpIJ/UshiJYTdB0TRQ987SpJrx5TNYpco0=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=YbfBvKIjd1tJLt01fwe1u/rbM4jHwka+WSH1TccmALxJPx4QkPrD/+FC7J3GX6sHCrXUcBckmDr0KOCmWgCskH7HB1mpNl/ashl8A8cb2lAqNWFDykIdw/rr2iFkXq+x8CN+wiYLzuYngJueTWr7r/xU+MwKytTibE9wI839oUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OW5oi9sZ; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OW5oi9sZ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7dd5a8dc8a2so30233277b3.0
        for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782129331; x=1782734131; darn=lists.linux.dev;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AjtVZE+G6ZNdvtmmDJa7f0CJF6c7p8Zb+gTkGkKohN4=;
        b=OW5oi9sZz2Qhp/458O/hv1nP1PDedVVILU9lXe+sGd5+E+n0HC8rAfvBp730yX8jc+
         VxbNykwUveMYWz+XwTVYIFOXs0H25ol34XqpcSpPNZ6mdBhnnvP1QuxMC4FZJHTbGuC/
         kCPBAwHov/19+Zl1ROt9B7qHwCf9UYQaJKRjAUX9tHoAU4jv2tgIhCw2ikT5lBY87VR0
         OLCQVtbMJUrV1yysmUXyhXq1TDT4KNCOxbb8x9yuPAXxLtHhpmtALtad28XBBFMSC/PZ
         YgpxNwad0uGqpOk/dJoHA6s9F//qsfSdStUowOLbep2SuSw592y3MWwDZv4UGMY+dQYv
         TFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129331; x=1782734131;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjtVZE+G6ZNdvtmmDJa7f0CJF6c7p8Zb+gTkGkKohN4=;
        b=FAo3JJlHOo+Vl6R8h+JnxEvXFc9rOJPbPkzU7tSQ7ZjxPPKPija72fga1yafnUh1Ui
         HWfdVDpESzBTWnunD7+E/Ou0SljeLzgVMIiFtpDofQRqM2e5F4CwEMMJl9UHmJCPrnY+
         J0pXbv2nHyEKPkFVYnwx+QNIGhVN5/yMvrgc4KePq9ZVcbG0B5VvwloA9WkrOy7Cjta5
         5qYNfp6JPBhT1Zt0roHCjdXv90S1Jsb7uqXLo8m1YhUKt5U33ACOV3Fcjl+a1Ye9Ynqg
         lYFrXhZx/R5vxb+l3rRGRwsD+vtozRtttE9RcbjipZd0PoAgc2htULJ0VW0X92tPf77N
         cnRA==
X-Forwarded-Encrypted: i=1; AHgh+RpK6haNB+KZhGTINuAGQgb6peyGnaRNx7JCke9fJYOP1xUCFGMIf6Ujp5BNsnmMetZbPjl/0TyTeucnUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfpjTDKh8Fs8rX/xmTAab77brkZxctBcE0+tcXWcdMKgLEfxoX
	Fhgz4hCje5f+4HmShNVUPxWnSVU6VZOi7PPe7r3wmqrVYfHO3K4SrLgM
X-Gm-Gg: AfdE7cmyvvv66vIOaYbAhagFKbZJ/Bn64wy9WXKntZUOx9nBoab7ek/5Ri8FmDZY5Fl
	EvZAT+S1gBJH13OfHbMBwi1pLwWJRrCsQ9sj7nPFmQ2aMBafPViy40bcZAaXHjwIbzlE83PnTVZ
	xTsp8IrQFbLmIvEXJfC17cck6yWOzmcwnB5Ka3PIdoohPeSD27kZAJIFtxic7XXDhnOECWDOHW8
	6Sh+9WLH2yMspR+dHNgE+NpcbGIt99fOKGx1TWPotbl36gfOaVm59UPP77GqWnI69N3+SgfexgH
	RnwYXXkx0QqvwCIUGJkBafO6vIZEADvgJRBr6wbTORCxVnGdQBgivPv+I5qksy2wEUrNXOH4eUh
	6OkoXCv755EKQ4SlPLFvuJTyb04oYYR/7mEK23gbu+nGv/wHYOKJBdiV+5qy2r/y7jdRP5jXfYz
	a1N0k6CNKKRt5/9PtsnCS9EVNGoOU7vt7V/7q2jCAsXg16+ZH2aZdjjgmb1OQP5wX75CcvIBbOl
	D/v
X-Received: by 2002:a05:690c:6706:b0:7bb:11a4:2e70 with SMTP id 00721157ae682-80130b0b8cdmr125913627b3.14.1782129331028;
        Mon, 22 Jun 2026 04:55:31 -0700 (PDT)
Received: from WIN6DK41G9CSL2 (c-73-56-149-95.hsd1.fl.comcast.net. [73.56.149.95])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-802606a918bsm29833007b3.43.2026.06.22.04.55.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:55:30 -0700 (PDT)
From: "Brien Oberstein" <brienpub@gmail.com>
To: "'Stefano Garzarella'" <sgarzare@redhat.com>
Cc: <netdev@vger.kernel.org>,
	<regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
References: <467b01dd017b$733792d0$59a6b870$@gmail.com> <ajkAlpiyPWmNPWfx@sgarzare-redhat>
In-Reply-To: <ajkAlpiyPWmNPWfx@sgarzare-redhat>
Subject: RE: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK transfers reset under backpressure
Date: Mon, 22 Jun 2026 07:55:30 -0400
Message-ID: <618701dd023e$063de350$12b9a9f0$@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGzlm2Q3QdtCPSkkHXQpTkeFGbfJwIutksBtovYSHA=
Content-Language: en-us

Hi Stefano,

Thanks, that matches what I'm seeing: large transfers reset mid-stream
instead of the sender being throttled (reliable above ~1.5 MB, fine =
below
~90 KB).

The bind for me: it's not just this mail bridge -- I use AF_VSOCK for a =
few
host/guest services, some of which open their own sockets, so the =
per-socket
buffer workaround can't cover them all. That leaves pinning 6.12.90 =
(losing
the DoS fix and further kernel updates) as the only blanket option.

A few quick questions:

1. Is a -stable backport of the merging fix likely, and roughly when?
2. Could a smaller interim land in -stable sooner (e.g. more default
   headroom) without reopening the DoS?
3. Will the fix guarantee backpressure for any packet size, or just =
widen
   the margin?

Happy to test any patch -- I have a solid reproducer and can turn it =
around
in a day. I'll also file this as a tracked regression so it's not lost.

Thanks again,
Brien

#regzbot introduced: v6.12.90..v6.12.94

-----Original Message-----
From: Stefano Garzarella <sgarzare@redhat.com>=20
Sent: Monday, June 22, 2026 6:08 AM
To: Brien Oberstein <brienpub@gmail.com>
Cc: edumazet@google.com
Subject: Re: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large =
AF_VSOCK transfers reset under backpressure

On Sun, Jun 21, 2026 at 08:42:41AM -0400, Brien Oberstein wrote:
>Hi Stefano, Eric,

Hi Brien,

>
>I'm hitting a regression in the 6.12.y stable series: a bulk transfer=20
>over
>AF_VSOCK is torn down mid-stream once the message is large enough to
>exercise receiver-side backpressure. By stable version it lands on
>6.12.94; 6.12.90 is fine.
>
>Setup
>-----
>A host process mails a guest's postfix over an AF_VSOCK bridge:
>
>  host msmtp --(unix sock)--> socat --(AF_VSOCK: host CID 2 ->
>    guest CID 101, port 20025)--> [guest] socat --(TCP 127.0.0.1:25)-->
>    postfix
>
>postfix (TLS-terminating, then writing to its queue) drains the stream
>slower than the host writes it, so the per-socket vsock buffer fills
>during a large message.
>
>Symptom (guest, 6.12.94)
>------------------------
>The guest-side socat exits status=3D1 mid-transfer and postfix logs:
>
>  postfix/smtpd: NNN: lost connection after DATA (153330 bytes)
>    from localhost[127.0.0.1]
>  postfix/smtpd: disconnect ... data=3D0/1 commands=3D5/6
>
>On the host, msmtp reports:
>
>  msmtp: cannot write to TLS connection: The TLS connection was
>    non-properly terminated.        (sendmail exit 74 / EX_TEMPFAIL)
>
>So the AF_VSOCK connection is dropped while data is still flowing, =
rather
>than the sender being throttled by the credit-based flow control.
>
>Reproduction
>------------
>Send messages of increasing size through the bridge:
>
>  body <=3D ~88 KB : always succeeds
>  body ~354 KB   : intermittent failure
>  body >=3D 1.5 MB : fails 12/12
>
>On 6.12.90 the identical test passes 20/20, including 1.5 MB x12,
>2.4 MB x3, 4 MB x3 and 8 MB x2. The only variable is the guest kernel.
>
>Bisection
>---------
>6.12.91, .92 and .93 carry no vsock changes. 6.12.94 pulled in three
>vsock/virtio commits:
>
>  1eca304f  vsock/virtio: fix potential unbounded skb queue
>  f3bf0f3b  vsock/virtio: fix skb overhead accounting to preserve
>            full buf_alloc
>  149205a1  vsock/virtio: fix skb overhead overflow on 32-bit builds
>
>The behaviour (drop/reset under a fast sender + slow receiver instead =
of
>applying backpressure) makes 1eca304f the prime suspect, but I have =
only
>A/B tested whole stable releases, not the individual commits.

Yep, I'm working on a followup to improve the status.

Basically, the memory management in AF_VSOCK has always been broken. The =

patches you mentioned are designed to prevent one peer from consuming=20
all of the other peer=E2=80=99s memory.
Instead of counting only the payload bytes, we now also take the packet=20
metadata into account, using a socket buffer that is double the size set =

(default 256 KB).

So if your system is sending small packets, then this is likely hitting=20
this issue.

My advice for now is to increase the socket buffer size. Thanks to=20
VMware, AF_VSOCK have specific sockopts :-(:
- SO_VM_SOCKETS_BUFFER_SIZE (0)
- SO_VM_SOCKETS_BUFFER_MAX_SIZE (2)

I suggest to set both to 16 MB (MAX should be set first).
I tried this with socat and seems to work:
   socat =
VSOCK-LISTEN:4242,setsockopt=3D40:2:x0000000001000000,setsockopt=3D40:0:x=
0000000001000000

Hope this helps.

In the mean time, I'm working on a follow-up for net-next to ensure that =

packets are merged when we exceed a threshold; we might be able to=20
backport this to stable, but I'm not sure.

Thanks,
Stefano


