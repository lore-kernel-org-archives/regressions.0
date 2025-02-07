Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2151A9B4D
	for <regressions@lists.linux.dev>; Fri,  7 Feb 2025 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953649; cv=none; b=XOZsrCxQseHpu/iAHe6Oazqd4e1SdOO3TDJZoe0gkeGPUTlHBF2zfGKEi/oKdGWIcPpqujeYONwRPEv6lYMY59AQte58iEV8L4FSDRXVv/rSTZRpVCUUpqDzmRoi8KrIV4Scb1+hseGcYA4uCyYnPH4nzBMAkcbIwjzasulvG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953649; c=relaxed/simple;
	bh=tUad5obh1sGKnZ1z6Mhnxwc9ebc79vt8oTrv7jdMbaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSWg0eM6sS9J9EOp/lzrcgwkDb3viueXfsed//3hMRegjXpb+nuSA16nir78qWfFctxmaNTj4yOEpuO88shNPw6WgeBSwIAOenrIIJkLanqONNQAelKIoaOkpC+s7dmFt97+R/9wJ5C5zCx0zGZB+a0EAhVhhvG8tJJU0jze0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMsZ+u8x; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMsZ+u8x"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467a1ee7ff2so20184751cf.0
        for <regressions@lists.linux.dev>; Fri, 07 Feb 2025 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738953646; x=1739558446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUad5obh1sGKnZ1z6Mhnxwc9ebc79vt8oTrv7jdMbaM=;
        b=KMsZ+u8xxVvCge9TrJmI3JXH2dZ6hO8ZYjF2v4VCZgxsxK6i5uHI7scNmpdMUTivYH
         T6g2aMGwaCWOmkTrlabTj5QDXPzJoCNG0jgGVWryWyiwl5cfQW8CjGM7TSE0I58JvLlI
         dhRGVES3mQyWoR8vkgu9Sg0FJdDUNtf1+bCOXVjWgOMgCPqTe808hOVmhmb/mCqmhJc4
         6utm4/Vj4T+O5ATu3HL474v4Bp4Qbm/qBZG2s/XIt2C0dt/vyOIR6E8C+K5fB3ckMxQB
         V/gtOlRpSMnQRdaND6If1ZTuWmSIkg2hwmzgl8jbEo43s23+pWtN/979UCy3S0/IguHR
         BqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953646; x=1739558446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUad5obh1sGKnZ1z6Mhnxwc9ebc79vt8oTrv7jdMbaM=;
        b=e8+BzQ8HV/MDNkfHi7g8gcQyn5IT8x4RlgCxSX05hghivEDJ6jcE33t9hBJIBbuYO9
         6PDKCSeQpceuGsD40hrJwOn5ix/7bs5gf9J1MsuNg+Z6AhmZIDkKLSgfTQ5iF+9PoIPn
         HFa5fP+1e37PFkAXjz4uvl9rJJJX9IFTuTZiphckN5hRu3VRH8ZK4F7KapK2EAxU9lnu
         Dj3UIYtQNHnDVxR1pGO9vyg6GWcHkFXQJyW2/f6R6m7q+PaSeYMneqV4PxoYa85F0JTP
         PWE4RilOZ2EViWJpb5IeuHDstn8HoSbr1pPBxR2DNHVHYATdAw4TgdvxAlYWOALjr2Be
         ADDA==
X-Forwarded-Encrypted: i=1; AJvYcCX1H5kFlJPXuCTQx2/LWO4BVqqtb+5x7eWmYmqt6qjicDC7GC8Sf1jdU24ymZE0+2U3pa6E+Gf3or7IWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV4lP+sKQcICyhjc9x5EI9w+UMrOpTBjNpM3/izoXJIH+ywfrA
	Unp8sUuYnNAGCselSbFWje9B1PEWSY/g7n6V3ANBZclO9YOMvk7HDeKgtocqF35S4Dqczd8M5Fw
	/h3hvg3KB/RC51V0E76kwmOCYces=
X-Gm-Gg: ASbGnctVTFdIBXov5tpHI/N808eKAPyv09/p43j5IxLFWIjPXAiXvmyPAN/v0IMWthx
	tBnuPlzcs0oEb+x/qvXrKI0sn98MyQTA2utEs8R9XMQr3yindZ+A3l/gHMis/lTKXTBDKq4Ud8A
	==
X-Google-Smtp-Source: AGHT+IFpWMWqwooQlduaHSefPEdDLXhN9MxWGpYS18PqjtFEZCMhIa8KHRBDKNK+utCkNE15zRjZXTH49Crp2j726b4=
X-Received: by 2002:ac8:5856:0:b0:46e:25ed:1601 with SMTP id
 d75a77b69052e-471679ead7dmr52946611cf.14.1738953646572; Fri, 07 Feb 2025
 10:40:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <Z6XWVU6ZTCIl3jnc@casper.infradead.org> <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
 <CAJfpegtvy0N8dNK-jY1W-LX=TyGQxQTxHkgNJjFbWADUmzb6xA@mail.gmail.com>
 <f8b08ef9-5bba-490c-9d99-9ab955e68732@suse.cz> <94df7323-4ded-416a-b850-41e7ba034fdc@bsbernd.com>
In-Reply-To: <94df7323-4ded-416a-b850-41e7ba034fdc@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 7 Feb 2025 10:40:35 -0800
X-Gm-Features: AWEUYZlUKF3uMuKxv0gUMyubbyPvOYLv_SrV7TmDhm4xS-0PwcRiRKnubnUKYwY
Message-ID: <CAJnrk1atv4N-BDWnwmESvczJhkayXyQqnLEypkmuJNKBa6gq8A@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, 
	Matthew Wilcox <willy@infradead.org>, Christian Heusel <christian@heusel.eu>, 
	Josef Bacik <josef@toxicpanda.com>, Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 3:16=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> w=
rote:
>
>
>
> On 2/7/25 11:55, Vlastimil Babka wrote:
> > On 2/7/25 11:43, Miklos Szeredi wrote:
> >> On Fri, 7 Feb 2025 at 11:25, Vlastimil Babka <vbabka@suse.cz> wrote:
> >>
> >>> Could be a use-after free of the page, which sets PG_lru again. The l=
ist
> >>> corruptions in __rmqueue_pcplist also suggest some page manipulation =
after
> >>> free. The -1 refcount suggests somebody was using the page while it w=
as
> >>> freed due to refcount dropping to 0 and then did a put_page()?
> >>
> >> Can you suggest any debug options that could help pinpoint the offende=
r?
> >
> > CONFIG_DEBUG_VM enables a check in put_page_testzero() that would catch=
 the
> > underflow (modulo a tiny race window where it wouldn't). Worth trying.
>
> I typically run all of my tests with these options enabled
>
> https://github.com/bsbernd/tiny-qemu-virtio-kernel-config
>
>
> If Christian or Mantas could tell me what I need to install and run, I
> could probably quickly give it a try.
>

Copying/pasting from [1], these are the repro steps that's listed:

1) Install Bottles: flatpak install flathub com.usebottles.bottles
2) Open Bottles and create a bottle
3) In a terminal open the kernel log using dmesg/journalctl in follow mode
4) Once the bottle has been initialized, open it, select "Run
Executable" and point it at any Windows executable
Note that at that same moment a BUG: Bad page state in process fuse
mainloop error message will appear and the system will become
unresponsive (keyboard and mouse might still work but you'll be unable
to actually do anything, open or close any application, or even reboot
or shutdown; you are able to ping the device and initiate an SSH
connection but all it does is just display the banner)


Thanks,
Joanne

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issue=
s/110

>
>
> Thanks,
> Bernd
