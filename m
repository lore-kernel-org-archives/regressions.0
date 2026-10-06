Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A149BD84
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298873; cv=pass; b=q0YP4K8xNA2Xk3tv4It+DrCrDLnVQyV6R7PZubqyq1PVIXeU8mTNQBei+VOPuF7d0bcLRXiAZlDw8gbdrKrfJi0XFjX3mFRWOdabQXN0+TeBa0Dq6v8LkFTQKIFNm32eVo4k86p9gOhe8IcfnZ/WUGFS1Q399SP47h7PLe+TpvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298873; c=relaxed/simple;
	bh=z0NbjY3hb65QgHF3JTWDHVs8sB4ltcgs7siabYrSJxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tI6aOJMiiBIo17gICt/z3t3ocsqnmtxhoI0XQ0JkeRO+SPlyYrtSzOyCfJSDwxm9wzOz7OT/PQ9Wa2c/BKVq/qU75DY1MRwHdPORonzFtjZXYg0mohWkPz5YfWWklj+EYmLAT6eB5Ec1xBiu4OsGWBRRnmmDi2WXozQia3H65hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khYO9N8B; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khYO9N8B"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e8c710847so95709666b.0
        for <regressions@lists.linux.dev>; Tue, 06 Oct 2026 08:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791298870; cv=none;
        d=google.com; s=arc-20260327;
        b=ankr+A1oL2U14qcD/lr4xNTqw13mCA0emhGg6ctIKKXguL6tQUp6Z3Kdv61/TchbGS
         BosAX6Bo2mHbWUt3g3q0qJfQSz5Kxj6cKSCYJkkvveejzBZH9RtA+SfBICXvT3IGMk3f
         i5LxMXuM09EtficxLnGLubQCLYD1KPQOv1AfUohKXqQzTzQVbRHvAfMbEJ9zJicTP1ub
         GxBiQj6Ru9HgJpnmTwhwxN2dvENiXpKAlm/3cOinrwKgYg7VPF37Y1dda6wqJNfXNsn6
         JV2KqecNSKscWn/abK7f8//tqmJ9S9/YNf3UJzDJ3jcSJ9fK5853yfC/1DTxBVgMHqz/
         Ua8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poE/AoMSO13XM0pW8fLOnNeMoWk6Qs7dHNHQLFRI0xs=;
        fh=Fa74C7F4c918Z2neBuA5O/Kv0qFCyavlKvVzGpB9+H0=;
        b=DPXdcP1kOhpBgoLEB7JTBbEpUXod9f5fKyVgbOq30v3VbQAd8P3GauI6OP2/eU40lG
         Aafkmqm4ZhUuZlPPpj3+dl8kPDn6eeL4IOPsuB4NxBvR0469K8XlkjpDTjQIOxryGREr
         VudL2vtU1BdazQK9STG33vM+a5LJtsZRh0wBKxQ7WChclvQJIvK/Na2awSg52GGv6RGS
         jDmJDEh5cC4DbQ+Ny9vidUYHW7/4KUkvBUrm/00GsolzeNc+ANRv3gSIBcHjarDQyy/0
         nlsJHROq84u/9kxcEtHjWHpSJmDDkF0Nko3ZUxOazO69bV1l5pMshJ9POISsd0bTcmLB
         wu1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791298870; x=1791903670; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poE/AoMSO13XM0pW8fLOnNeMoWk6Qs7dHNHQLFRI0xs=;
        b=khYO9N8BIZOFz1UIgNA4aAw6TEZoJUVJ5Cp7ZRepqAsphdswcF5fdi24474d7tzVvi
         DyVb4s0fe2jnVd9deF0NaaCrNom849R/Wfl0tAHIBRasaVLl/jdQCDSOMgmPsBgchlEJ
         PJNBldZke0lTUpC8isA/FmVf6cJfiovJ+A0cFlxBMdBfz0OxJrMe40UQUQ0MSECj9Lr8
         soPrnRq17xHYIutBLAsU9h6SJhk5XMUXHIsLfwBhx6i/Cr90rq7yuRRCZtjirjL7lRIA
         gxqqnAMUHv+9i92hO/WMMZO8VAZI6+YJ0vHT+5PMtSIOWPDY1WZMHHN51ALYHPIwYid6
         m+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791298870; x=1791903670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poE/AoMSO13XM0pW8fLOnNeMoWk6Qs7dHNHQLFRI0xs=;
        b=KXwKvI17QFY76+uYzMcbEdpOHm6BKlEWaJE1KNr57jfDw4YM4b5ylKmzpFMcp1NdKR
         tlMApQD+KuND0Gx3nowyynxdjwwByrA5RJn8j6GoFvckabzNNG6eChXrPmWP7TNGtpOW
         33v9ovYr8LOkII8WRiNQUEAC87uFNDGarsdKVi7gI0RW6zb9mPUG9PkcauzJ0pQ39vrM
         hGm+e/SOZQok30BGWXPSDGyqth0dtnNax4Ik4tCRFEDvsFpaiYHvRnMjfY8q4ztoinMU
         +MRoAfXtrZSjQb6WJ/1ySqR+flDRv9NETnEUKjrYCno1rPdslhsRIsEA/31dmo8HW51u
         huWA==
X-Forwarded-Encrypted: i=1; AKwUvBw/3J0AdJYnl+pyggdCaQgSHCpT5s1CUQA+/IlDERA6muuGCjuWCBFHzD/CKljWXNIz/iUknKNHNs6p0w==@lists.linux.dev
X-Gm-Message-State: AFuF++lhxVdQCMLp6WHFhPsfcqn43A9kVcS17os817HF6BkpwirEKUtT
	LfQR5/PW3etsSo2cW//p4W31/n/zf8q04EAhlw6t1yKRHyYh4Lmtfi6m+GWyO1bC+YGy6Jwapzm
	EjgrYldnhmuwLHZBifg2sYScKp1ImIKA=
X-Gm-Gg: AYBFou0Jv9Dv3c1FHZ/xjtmhV/e6w3Fg5WsPP2ZCwLWFFRGmZb4cMsdw5Kkl1yV4jhs
	c+Ge/miyFtIWJlGPnewyNJduURD56D916dL5lMzTtZt8yxJTwrwMwksjmdXQC15oj1PDHOPJ1Uv
	X1MOAlZsZL0TVIkSZksZDiKpNZ8t61FrJ/UmqMTMLNszNYPzaXuWt8jFcTcI974HkqLq+lN+OlY
	7uV35D8+7k4h2WQxwPYhPGUJwwZ+KQc0SpRF5siP9Xxi5mVhZ35qG5i3o/FwHUYZ9OfCm2XxDcd
	icCYQQ4fadPAJEvF95qLDziqXjm5F8q9LCUti5Xi5/A6qwADe1Xdm59JX34x2xMUOckoUeYNkrY
	u7fZLIQ78+RC4cHTBPIuC+tfeufhHhND9zDkcc/ixwg2s9D4NimxpJUK6urncNvrDNvo0xKI/gH
	ZZ77ujDUFHqJtAjp3IZ9gG
X-Received: by 2002:a17:907:9618:b0:c2e:49b4:ab8c with SMTP id
 a640c23a62f3a-c3169f86340mr164162466b.14.1791298869485; Tue, 06 Oct 2026
 08:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABZrw2HcaOh3DHTJtxU5dXrb3Vg19scr6+qR-xe_+R7rME35_Q@mail.gmail.com>
 <20261005231914.GA639967@bhelgaas> <CABZrw2F=pOOq7+puKohtYMihYqWCevCFc7rkAOETW4T5Nf4n8Q@mail.gmail.com>
 <asRjch1fMBslk07D@wunner.de> <2a7a97cc-7ad0-4e6f-845a-dd841d36079b@linux.dev> <asTDCW28kKBfKAVs@wunner.de>
In-Reply-To: <asTDCW28kKBfKAVs@wunner.de>
From: "Perlow, Jason" <jperlow@gmail.com>
Date: Tue, 6 Oct 2026 11:00:58 -0400
X-Gm-Features: AclHuK__dVMPtlbG_nW0AT2uQ9jcKaXMGxE8ey6R9y5x6f-QHJqrNDrofO4pLOI
Message-ID: <CABZrw2Ht3f8nJU7bJezSMuVWfrejV0HzqzRPA=ibQYPc9dGKoA@mail.gmail.com>
Subject: Re: [REGRESSION] PCI/AER: MacBookPro16,1 powers off ~20 s after boot
To: Lukas Wunner <lukas@wunner.de>
Cc: Aditya Garg <aditya.garg@linux.dev>, Bjorn Helgaas <helgaas@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukas,

On Tue, Oct 6, 2026, Lukas Wunner wrote:
> Advisory Non-Fatal Errors aren't handled through the Uncorrectable
> Error code path. The kernel just reports and clears the errors.

Thanks, that corrects my guess. My first mail and my follow-up
("a second, separate way for eddba19b8b5f to hurt a platform")
assumed the uncorrectable recovery path. Please disregard that
reasoning. What my tests show is only this: with the bit unmasked on
04:00.2 (106b:1802) the machine powers off at 14 to 24 s, and with it
masked there only, it stays up (120 s). I do not know which action
causes it.

> A quirk does sound like the only possible solution. However I'd
> really like to see lspci and dmesg output with the bit unmasked
> shortly before poweroff to get a full understanding.

Understood. I am preparing a capture that survives the power cut:

 - kernel messages streamed over the network, as before;
 - a loop on a second machine over ssh that reads, every 200 ms or
   so, the Correctable Error Status and Mask and the Uncorrectable
   Error Status of 04:00.2 (and of the root port 00:1b.0) with
   setpci, and logs them until the connection drops;
 - lspci -vvv of the whole tree taken right before the bit is
   unmasked.

The ssh session was still answering at about 16 s in my earlier
runs, so I expect to get several samples before the cut.

I would also like to split two possible causes with the diagnostic
kernel, if you agree they are worth separating:

 1. the config write that clears the mask bit on that function;
 2. the report-and-clear that follows when an ERR_COR message
    arrives (the status write on that function).

Case 1 can be tested by unmasking but never touching the status
register on 04:00.2, case 2 by leaving it masked and clearing the
status once at boot. Tell me if you would rather have a different
split.

Aditya: thank you for the Windows listing. It shows 106b:1802 as a
"System Device" there, which tells us it is enumerated but not
whether Windows touches the mask.

One small point, Lukas, in case it matters for the Windows check:
the Advisory Non-Fatal Error mask bit (bit 13) is in the
Correctable Error Mask register (offset 0x14 in the AER capability),
not the Uncorrectable Error Mask register. The status bit is in
Correctable Error Status (offset 0x10).

On the form of the quirk: I will go with whichever you prefer, a
flag in the PCI core that pci_aer_init() honors, or a
device-specific DECLARE_PCI_FIXUP_EARLY for 106b:1802 only. The AMD
switch port 01:00.0 is not involved in my tests, so I would keep it
out. I will not send a patch before the capture above.

Thanks,
Jason


On Tue, Oct 6, 2026 at 5:44=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> On Tue, Oct 06, 2026 at 02:01:52PM +0530, Aditya Garg wrote:
> > On 06-10-2026 08:26 am, Lukas Wunner wrote:
> > > On Mon, Oct 05, 2026 at 08:17:12PM -0400, Perlow, Jason wrote:
> > > >   masked only on 04:00.2 (Apple T2 Secure Enclave, 106b:1802):
> > > >       stays up (120 s)
> > > [...]
> > > > So here the trigger is unmasking Advisory Non-Fatal Errors on that
> > > > one function.
> > >
> > > That's quite unexpected.  Maybe there's a bug in the PCIe IP which
> > > Apple used for the T2 Secure Enclave device (which I believe is a
> > > fully-fledged arm64 CPU with a PCIe port in Endpoint mode).
> [...]
> > > macOS likely never unmasks the bit and so they never saw this during
> > > validation testing.  Is the T2 device visible on Windows?  If it is,
> > > it seems Windows doesn't support and unmask Advisory Non-Fatal Errors
> > > either.
> >
> > T2 device is visible on Windows as well as "System Device"
>
> It looks like lspci is also available as a Windows binary:
>
> https://github.com/pciutils/pciutils/releases/tag/v3.15.0
> https://eternallybored.org/misc/pciutils/
>
> Could you double-check whether it unmasks Advisory Non-Fatal Errors
> in the Uncorrectable Error Mask Register, on the T2 or any other device?
>
> Thanks!
>
> Lukas



--=20
Jason Perlow | Argonaut Media Communications

Voice/Text  (954) 242-3484 | jperlow@gmail.com | Blog: techbroiler.net
Read my Tech and Food Industry articles: https://linktr.ee/jperlow
Bluesky: https://bsky.app/profile/jperlow.bsky.social

Need to schedule a meeting with me? https://bit.ly/3y8P3Gp
