Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C662D5408
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 01:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572926; cv=pass; b=dFguzLopmcBW80SGGFqm4ssMjTjcxWuBfJIXfGmcmhUzzPQbEpti83b3zwzKS5eWRH+f0cIQJrJTDf5HNVIuB3+kNUGqSsa3xvV041/Jw7t/otcMW5SItyPLgS9trydwUuSK6vIwsy4MQC2P2TvXoGz+2PbyNCH5AnYo5XDKVMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572926; c=relaxed/simple;
	bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=renkYhW48FJ1aF3Ze1aNLPl++CCDwObp+BNrVp0aX8sA1c0g7G8qYQsL4zZL0rKsiaUGqy3qUVABGiWLBir6+PE89ul2yjDmObinriyi0F2w0ODAGv3HVMj041EGN9bIW4Q56glyXwv9WRc6CYq0lHirEfLEjx6NKcqSQD4PDbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3Wghra7; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3Wghra7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e7fd978beso28592626d6.1
        for <regressions@lists.linux.dev>; Fri, 04 Sep 2026 18:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788572923; cv=none;
        d=google.com; s=arc-20260327;
        b=O0X0V77Ahst+TprVZd56aWhk+bZ7btKKzhPU38uz+dNIJOZo/swPakKjSMj16FrgfB
         CVgJ+m2qTbMLQbwZDs+AfJ3FPQnKBDJLwLZpuAzpKWhIhNFCPeADP8mLbrjpMzWpqGtJ
         hlOLIiSLawg/FgqwgHB1P9EaWvqw5Wa2wmFMLsc5UhmHn4CQmDo2NRBDJrGcT115sEYO
         aRGcOcMIMgwX8yr/yFXZxdZw5B+QIeaNqvKofAnSnV5H20Ph3oOPQm1dFlBjnJdxWHFh
         42BnGt+hdUiO/uZ7IGkeBJ0DgPVzJ/2YJpcxBiMoWHUtMx5VS6R7ojvRvF8mRm/M3zXs
         a0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        fh=9aRjlORusyY4Y5a+fK8DtSzoQuFGVpnNgC4ssWMqzv4=;
        b=Yo84nYsmml4cIbO89rvD0SF3aIvQY5SW94mBLameooAW2oZS8mgrBveWd17Rfin4pm
         fgLJXjGVwSX8BvGnQcJuff7gsRxMwIgnLIOuuSwWe8WWKXZehrlWYlguWMg11VOpfsD5
         9cKneTqPmTUT6iEjRWBJ9o7aXwW1Vp1ejdjx68P2hlqJZKcK/Ryxgnnup8QzIa5JuIG1
         h4hvPxOQ/IZt2ZEQynjC6E8d1F3DtMtO2noKoS9YS1ftO6Yo+UMtLWX7kdq0cvQqolQ+
         bGQlwnXt1iPKi553D3baiZsCLYOTsgSDAzy9B9qDdtP3DHUIJbgK5IKM1T0fIGRTbPwM
         wa4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788572923; x=1789177723; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        b=C3Wghra79fWU8+EG4ipvUlc+9vaHCuysFKxkTQhe117AphNcgT1SMxSCDO2yeCRXWE
         7pjydCnCktmPc2bypa8Tw06tsSQl/Tr+TNgemnOFa5AxQ1x1lmNO3PdByVzLIMAzNfIn
         53gd1zQGLtnSrq+LHonrDyLK4SX2N4gR8t5Cs8xOgmkFe7oZGRsoKoGyxkEap9ouDK8T
         RSZd0O+f6T62B924hIVp9DAKcunuXmDyS/KT/HaZvPh5HGAPV559tirsciPkGwdZp5Rv
         P8Sxz/w+yZPpRUlSuWVVqrVbBkLkRE6qH2bxh4X7a9p7Me6oLUNCwxam1V18rPpXHpxF
         8gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788572923; x=1789177723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        b=TmNqb/dxT57sEMLdJmV3LVg8gJq7O/gpfRRcua0GsyD5iNNCSeabXzr6d0sXb+PVIk
         M6DwgmwbvO3OQlK3OGDhiSlitVwS6Sn0xpqTcsbGRr8HzAEtbWpeaTa/S/ACSvg05cN/
         p2XOmjmubwvgYWQhqaYyY8V6nWxDKExvvW7/IODXmzntSInWf1ph7t086pfpD0kQOUK4
         Cg3KodtHnx/dXQN19cBqibXcbb0urTWn6ajNDjfCgMJ1DAYldgmf6Sxz/25VhZzwOFrt
         wura0k0wuyG1l8OS8LyaRakl+Vc66eT7Kkq5Wn0fE3FZOhX8qJyMmxQDPDR5JivQ/nA6
         QM9g==
X-Forwarded-Encrypted: i=1; AKwUvBzKBDiEysdJz09G5bfSo0LpM3XipsOpsPNWLH9dyAHXQ6cRL7CqsrrmvvM5fyg+4Q8OPqjEo1g2q1QTKQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lNeqhEn+o0kUrXuMCDh/Zsnnpgukvb/vE/++VUpXUjdbPpPMHi
	sZtOH+Ss9zAwFCVrkwGP9jOzv23I/Ml7aPaOeYvv6ESBQDIgjmcK1AgXSupcM5dqwFfLnAsqn9a
	6DDl75VddohwcmrNkKzl22hAmFIR4goY=
X-Gm-Gg: AYBFou2yoIHaaKja92ZG7PhmA+l2C6uBVo8zyv8ejwAhU7XzHUbQQvoX/DJ2aaH3nnz
	lw6FDuhn3AqEeqCxmG80AXhIzNh+uTShaTo/wTrxkE+oXx7xm7uYin//qIi1Fah9QL6m7pvwQ7a
	6av1uVY/CVun5uH+Fioi6IjRLTGHYUtEmyODrjAAwVKGakSPXDfBW4kK7989W4zU+yrvfkecAFP
	uM8SOdKqVbV4cuExMucEZ9jM4rPs6PYbMlJi6L8l+uNh1Qa2eFxcq/ygcFAioY9AlnIXfsygvYj
	/DaD3LWYGtuiYgULxKMhGaiGUt8EQ33Cy0UWud27QxRQPJD/0FQzJhZ+lDTIkAoVy/w7mXXZFao
	=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr980114985a.24.1788572923149; Fri, 04 Sep 2026
 18:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com> <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com> <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
 <20260613112648.2ea61301.michal.pecio@gmail.com> <19b188be-5f81-4f87-b29a-e4ac1e55221e@leemhuis.info>
 <CA+_z3hQ2pZT3Yp+psTRF52Hm9rw7oHW+SdxThxD8KmoU24tkjw@mail.gmail.com>
In-Reply-To: <CA+_z3hQ2pZT3Yp+psTRF52Hm9rw7oHW+SdxThxD8KmoU24tkjw@mail.gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sat, 5 Sep 2026 02:48:32 +0100
X-Gm-Features: AcwNN1X2YvxxakeI2M9gY1_WVstkRlX6waqU8JBaM0mLh57-pyD-5MIBvF2lQ5Q
Message-ID: <CA+_z3hQn0L7ks9x4PF9O4Y0jvkPOLGk0r9Hx=W7oS2edh0_qNw@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Michal Pecio <michal.pecio@gmail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, just checking for any updates? Happy to test patches.


On Mon, Jul 6, 2026 at 12:59=E2=80=AFPM Martin Alderson
<martinalderson@gmail.com> wrote:
>
> Hi, no update that I've seen.
>
> I suspect this wasn't a regression tbh. FWIW the patched logitech driver =
has fixed it entirely, but it would be best to fix this for other ones too =
- I did some analysis with an LLM and it thinks there are a good 10+ HID dr=
ivers alone that are potentially affected by this bug.
>
> I'm more than happy to test patches if required.
>
> Thanks!
> Martin
>
> On Mon, Jul 6, 2026 at 12:48=E2=80=AFPM Thorsten Leemhuis <regressions@le=
emhuis.info> wrote:
>>
>> On 6/13/26 11:26, Michal Pecio wrote:
>> > On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
>> >> So the ordering that kills the controller is:
>> >>
>> >> 1. dj work issues a control SET_REPORT on ep0; the URB lands on the r=
ing
>> >> 2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port =
to U3
>> >> 3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
>> >> and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=
=94 and
>> >> that flush unlinks the still-pending ep0 URB
>> >> 4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s=
 timeout =E2=86=92 HC died
>> >>
>> >> That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
>> >> after "Set port 7-1 link state ... U3", and the debugfs command ring
>> >> shows the single stuck Stop Endpoint TRB (slot 1, ep 1).
>> >
>> > Makes sense. And good point about usb_hcd_flush_endpoint() - if this
>> > gets stuck then usb_suspend_both() can't complete, which explains why
>> > the HC still isn't suspended either.
>>
>> Was this regression ever resolved? Looks a bit like this fell through
>> the cracks, but I might have missed something.
>>
>> Or is that no regression at all? From the initial mail in the thread is
>> sounded like one, but it was never bisected afaics.
>>
>> Ciao, Thorsten
>>
>> >> I had Claude patch the driver and this seems to fix it:
>> >>
>> >> --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
>> >> +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
>> >
>> > Improving HID drivers is one thing (which should be discussed with HID
>> > maintainers - see Documentation/process/submitting-patches.rst), but
>> > other drivers may behave similarly and it would be nice if this didn't
>> > crash xHCI controllers.
>> >
>> > While URBs on a suspended device are weird, it turns out that xHCI
>> > spec (4.15.1) doesn't prohibit that, it only says that endpoints shoul=
d
>> > be stopped. Which they are - problem happens when we try to stop again=
.
>> > I'd expect such a command to simply complete with Context State Error,
>> > which it does in my tests on different HW, but yours gets stuck.
>> >
>> > I'm not sure what specifically triggers this failure - is it stopping
>> > a stopped endpoint always in general, or only after using the SP flag,
>> > or on a device behind a suspended root port, or something else.
>> >
>> > Would you mind testing some patches? I'm thikning about reordering
>> > things in usb_suspend_both() so that URBs are flushed before suspendin=
g
>> > the port, or investigating what exactly breaks your chip and adding
>> > some workarounds. We don't need to stop a stopped endpoint, we could
>> > proceed immediately to Set TR Dequeue, but it's uncertain if your HW
>> > would accept that.
>> >
>> > BTW, you initially stated that this happens on the first suspend after
>> > new boot, but are you sure that it can't happen later? This would make
>> > it possible to test patches by suspending repeatedly until failure.
>> >
>> > Regards,
>> > Michal
>> >
>>
