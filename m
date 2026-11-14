Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75260A6F7F
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 13:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B75260A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRiIjS3g
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9495c633eb5so66566885a.1
        for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 05:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794661799; cv=none;
        d=google.com; s=arc-20260327;
        b=XbI42zjjqtQtriLATmQtCrwr2h9/r2FFZdSKR1sqHfBUb7N2jZzfOq7IXxb/rwuh1D
         FWNpe+WPfCkD4z/YL13qWvEWHLWRdhFW6S8l4chvsbtQsdICyDXStxgcfG80rdkTj/0x
         h9gMGdOxIfI2XI9mNmn9GKQ170Y+78WYTqKP2M1objTfKiFrPQzf8aTRqedmk0B+CXjs
         Ni7PpD4F0/LArVN6DGPi1TYQfqWQioD+KtA99GYjCPoq+f78sXvy0iQk6qgMz84DbIlV
         Kc52Hx/RZcI/8LHHvliitf6rqVvUwOGoEc0n4OCwkhXDUHyaTf+3AY+QhE5oFLl41zNZ
         IlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6aPzjQz0I4393BXaraTm1sEujHHhSD7mUhZkqvD2RU=;
        fh=eifJZjg+XHdQQ4WZX/0Q42gw/Jw5t/noMMzaFQtskMI=;
        b=paCBhvyfRF/bKc+CEk2ahCcfWqaUFt+3O1ff11grOTeXhweXJfEboRa4m6xYHfIwtu
         n63P0QISstBbKKRZHB454CIV/LrpYIwforS+jJOegyTFJXG8hucMYjaMqQNXcrJxyTni
         Tsx3scosdrVd7LOvUDMYDHOhQlNNgu8PEZYljTNT60bZaGxXtcRLOaVt6yuw7nDSWbg2
         py8DrSrY13U0W/NdnkS4RlR9Z/8970vLurSo3p91xN0QPHgjA4w85qQv/TUIrEw2cqrY
         ub+9p6cxSlRty7gSBKDj9P4PgXbS0SHijHUA0zkRn4kg7yS1hzxHbIpI0OFSxvdMTQbx
         P5KA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794661799; x=1795266599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6aPzjQz0I4393BXaraTm1sEujHHhSD7mUhZkqvD2RU=;
        b=rRiIjS3gJinc151Lu+yMziT6/JNEbYWHWVBqBwbFqaEyogAgfRwU8tErHmpey15ZOr
         Oa6bYex/YJtJRl6cgwr07iZMN4DsR8RBmbwP9u4dV2qIy2ITNbh4aPp8JhmClrnw5HGp
         BB0KckljUrRzt1TkXEUcT6moLKnJ6pIdoV1Xgnmq8gaJrnbvy0SmI+vQfrZLVKXlsUjC
         V15OjYgridPdHFugZSmeVPbOv87JtQPZ3qu+lQjIcdai8wQ4SdDazJXsfxQoVpyyKTjg
         9Wvy0Crkt2u6rtwd9C3gs/oB+Of/uHNdc3FBU9BCcaH/rQwLBJTSwQKCK3FYEByRFvNr
         rU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794661799; x=1795266599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6aPzjQz0I4393BXaraTm1sEujHHhSD7mUhZkqvD2RU=;
        b=nHD8vI8WGJbVgRzZ0aBAtptCnfh8vKxeYIuruoOZtE6SD2ocMwXWL7UMmNUMYpQav1
         jCkJdl9iRH4zrO8MgOPNp3GznzKBxw5LjWMFCK2FnS17J3buON5ay+rpii0Zst8eedrz
         IpCHsAO3glbvVmEcWxgDubwQV7iWxAVql2yvfC86H3vc/08lp1Ma5lAlYr1+y+Jog2jp
         nYoslPMO2tDHaDRQKTOZ168fAiQQT0bTJHDBWJd5xKhsWJ3ybDi0LxsnUNR5baVXVuql
         SFL7WLEhWxN+f8/jFhFFPo+S/B4bAhJBTrzQ5bBqdOyYukEFaDgwjfqkckKqcSWn+Xf7
         E98w==
X-Forwarded-Encrypted: i=1; AL+hErEuP+h5iqZQhLxs0bSCG+CKJ2dTpfdsBd+SD+iai8+oRQ/eik0+YYIsPhqCo02Kj61FJluuC0/lrZb2KQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/9t9kURFiP0sezN+xuR/gHUgSKbM4/VSFUX6xzRMkKrKxkQ08B
	CawDS8mm6eEuz1NLIrhQcMiqeZhm+Y51UgrZe+YbwGVPmr1Jl+F8UG4DcSG4paU5v1RCjIZH+U0
	tgTy5Riq+20FwBB8q6BqcyRdi9AWHlZQ4zcgK
X-Gm-Gg: AYBFou37wC2lAodyqBYEdFIWhGOSqLcHEkrEa3DaYjoyPc3akya06o5c1Isx/pLUJ2K
	/9CAHfQVD/iWrwb1b3XbjCPQvdTux/kc5TnMfFTHPhafTitOOkiwG5CcwDcjqcjZRYAYmyU/0OY
	FuXok8UlN8WyaCtxl0CwTly2bamJxXQh0Afi9tVvuwVhsvNa4yiCfFGPzA4pSBatyvIILTbMYZM
	apQ9YQ2PKK62xQC4ajdpU1tFEh3F1hdjlx+jh/USiWVXp7H4GEez42CjEK1i83Ug7YtIoK4Sp5f
	S3dtjpwYzuDAHpRgF5ghHsxpzRSn3q7pQ9jwHZppFJxWmNFJr89M/XFahC4KwAlstW4DPRGOM2N
	hfYdSuAA5H27Mm3ho0q4R3eyNQ7dlE32Md7hrFx2FHyemFWPZ6ZMwyVijh+xpCyIgLTZSdj0=
X-Received: by 2002:a05:620a:2811:b0:949:6dc5:2a77 with SMTP id
 af79cd13be357-9496dc556c2mr95033485a.50.1794661799471; Sat, 14 Nov 2026
 05:09:59 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAMX8SmaXHh-dzH2n6pRhQr8q=iN=Ui7T3TC42e35LBUjvMaH1Q@mail.gmail.com>
 <36fc271e-eeae-48ec-ae9e-4fa284605112@leemhuis.info>
In-Reply-To: <36fc271e-eeae-48ec-ae9e-4fa284605112@leemhuis.info>
From: Ali Lin <alexlin901107@gmail.com>
Date: Sat, 14 Nov 2026 21:09:48 +0800
X-Gm-Features: AclHuK8A4QzU47YQEYYfrdYZoEwsqcBOII6towWo4Sz1ZfP0mPio_yW5yRpqkZk
Message-ID: <CAMX8SmbiJ1Nub+pmQkfZcbisiok7d41L4OEzcWDhHWgbdgUD=A@mail.gmail.com>
Subject: Re: [REGRESSION] HID: Corsair K70 RAPIDFIRE interface 1 times out on
 Linux 7.3.4
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev, jikos@kernel.org, 
	bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for pointing me to these fixes.

I attempted to build a custom Arch Linux 7.3.4 kernel with the
upstream xHCI patches applied. The patches applied cleanly (after
accounting for a minor comment spelling difference in the Arch
source), so they look like promising candidates.

Unfortunately, my system is currently down to 8 GB of RAM due to a
failed memory module, and the build ran out of memory and froze before
completing (using the default Arch config with DWARF/BTF enabled).
Because of this, I wasn't able to boot the patched kernel to verify
the fix for the Corsair K70 RAPIDFIRE (1b1c:1b3a).

I'll hold off on local kernel builds for now to avoid further
instability, and will retest once the fixes land in a future
distribution kernel update.

Thank you for your time and assistance.

Best regards,
Weibo Lin

Thorsten Leemhuis <regressions@leemhuis.info> =E6=96=BC 2026=E5=B9=B411=E6=
=9C=8814=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=884:01=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 11/14/26 07:56, Ali Lin wrote:
> >
> > I would like to report a possible Linux HID regression affecting the
> > Corsair Gaming K70 RAPIDFIRE keyboard (USB ID 1b1c:1b3a).
> >
> > On Linux 7.3.4-arch1-1, the keyboard works for normal typing, but the
> > Num Lock, Caps Lock, and Scroll Lock indicator LEDs do not function
> > correctly after boot.
> >
> > Unplugging and reconnecting the keyboard restores normal operation.
> > [...]
> > Relevant kernel messages on Linux 7.3.4:
> >
> > [   36.929377] usbhid 1-4:1.1: can't add hid device: -110
> > [   36.930405] usbhid 1-4:1.1: probe with driver usbhid failed with err=
or -110
> >
> > The USB topology on the affected kernel shows:
>
> Not my area of expertise, so take this with a grain of salt, as I might
> send you in the wrong direction. But it sounds somewhat like the problem
> this patch tries to solve:
>
> xhci: give back TDs and clean up ep0 after disconnect
> https://lore.kernel.org/all/20261029204324.658845-2-mathias.nyman@linux.i=
ntel.com/
>
> You might want to compare your error msg with earlier reports that led
> to that patch:
> https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/
> https://lore.kernel.org/lkml/20261010071811.20483-1-yiyu@yiyuzhou.io/
> https://lore.kernel.org/linux-usb/20261023132616.339833-1-diogochaves@me.=
com/
>
>
>
