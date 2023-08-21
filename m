Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239C1863
	for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692614371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eb39vEwU6YS1gjwjbC+gfgmbn74x4GCsfZvxii4hs5c=;
	b=fjOER6X13c0okIXy/l3Km3FraPsJRxQ97A+ZahMxq9iv89gfzECSwKaAPwHYtdLX20osVg
	CFebr9OEp+7tlz0IboBtXufxtd96g53HvSrqByLWVWu6afYJ1DbUzWqBTtLVpEdy6xMCrd
	v2M/t6DKzTrLCZMgECc8H0hSqR3SioA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-LtOrQ6QSPrGBOgFMdaaHuw-1; Mon, 21 Aug 2023 06:39:29 -0400
X-MC-Unique: LtOrQ6QSPrGBOgFMdaaHuw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-26d1ec91c8aso3311197a91.2
        for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 03:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692614368; x=1693219168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb39vEwU6YS1gjwjbC+gfgmbn74x4GCsfZvxii4hs5c=;
        b=WllFRncWXpdgrtVRnxLF9EtcIMCXAkc6+7nb0wZ967mKGY4YafYKM0SIY4kiEjWcnZ
         N/p/cT0RSVFXuQohzjrrq1W3auqnXQdtNwrvnHr/LD/rRBOD6HPx1QCDvt0lQtL5vSq4
         K7v8Xacf7nZTh/jAdlzYJrNQu6aTrgtoVXvpkx/NRxX2DgN8IGB2qyEP7AOHvgPhmBkd
         ZnmN/GlPS7Dib2luWLeArPfqsUL4xuMapXNZK/pk0uznRNsk+oMlLiU8bivOkaDjZe69
         rSMF21IvbVTXUf4IjSlhicjxpiifkcq+jvu+HtqH0szhxVb04sCiM7FZcScNC/ijojoH
         Ps7A==
X-Gm-Message-State: AOJu0Yz98yfnhJCMV1+zqxFLPM+Qs+dVPfnF5+WIlSGIZatrtu1e8Iqr
	LPdmASBzrTLHAs5+aTYzAoeyfYArNqi81YXIzJETUd3e7LbCIQcga7leC3uZDqyEmuH9y5D6gTZ
	Ih1G9V6O2NCE8AjnwkypZEFE1kYFWmu8WPBe7hg==
X-Received: by 2002:a17:90a:e285:b0:268:c7fc:b771 with SMTP id d5-20020a17090ae28500b00268c7fcb771mr3271808pjz.14.1692614368573;
        Mon, 21 Aug 2023 03:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEjcynWgeddgVf3x/UFb7711wXal1zhaohdOU1viEpeONCTG+12SD6nMzh1fLrcEkPxVq7lW3NUuClo15cCfw=
X-Received: by 2002:a17:90a:e285:b0:268:c7fc:b771 with SMTP id
 d5-20020a17090ae28500b00268c7fcb771mr3271803pjz.14.1692614368290; Mon, 21 Aug
 2023 03:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kamil Paral <kparal@redhat.com>
Date: Mon, 21 Aug 2023 12:39:02 +0200
Message-ID: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
Subject: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: linux-pci@vger.kernel.org
Cc: regressions@lists.linux.dev, mika.westerberg@linux.intel.com, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=3D Summary =3D
A Thinkpad T480s laptop with a Thinkpad Thunderbolt 3 Dock connected
can no longer resume from suspend. The problem was introduced in
e8b908146d44 "PCI/PM: Increase wait time after resume".

=3D Detailed description =3D
When running a kernel containing the identified commit and trying to
resume the laptop from sleep, the laptop's power light changes from
blinking (sleep state) to shining (running state), but the display
stays black and it doesn't respond to any keyboard input, nor to
ping/ssh, and no logs are written to the disk (which means I don't
know how to gather error logs). It needs to be force-rebooted. I
bisected the kernel and identified the commit which causes this
behavior. I used the vanilla kernel with a Fedora kernel config.

The reproducer is:
1. Connect the dock to the laptop.
2. Boot the laptop (in my case, to the gdm).
3. Suspend the laptop.
4. Resume the laptop. This is successful before the identified commit
(the last tested good commit was cc8a983d0fce), and unsuccessful
(black screen, frozen system) after the identified commit
(e8b908146d44).

The reproducibility is 100%, I tested it many many times in a row.

When the dock is unplugged, suspend and resume works as expected. When
I connect a different laptop to the dock (Thinkpad P1 gen3), I don't
see any resume failure. So this is somehow related to the particular
combination of Thinkpad T480s and Thinkpad Thunderbolt 3 Dock. The
dock is running the latest firmware. I also tested "pcie_aspm=3Doff",
and that allows the laptop to resume properly, but then there's a race
condition whether devices on the dock are visible to the OS or not
after resume, so this is not useful even just as a workaround.


I already created a downstream Fedora bug report in Red Hat Bugzilla:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2230357

lspci of the laptop:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1982541
git bisect log:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1983351


The commit which broke resume is the following:

e8b908146d44310473e43b3382eca126e12d279c is the first bad commit
commit e8b908146d44310473e43b3382eca126e12d279c
Author: Mika Westerberg <mika.westerberg.com>
Date:   Tue Apr 4 08:27:13 2023 +0300

    PCI/PM: Increase wait time after resume

    PCIe r6.0 sec 6.6.1 prescribes that a device must be able to respond to
    config requests within 1.0 s (PCI_RESET_WAIT) after exiting conventiona=
l
    reset and this same delay is prescribed when coming out of D3cold (as t=
hat
    involves reset too).

    A device that requires more than 1 second to initialize after reset may
    respond to config requests with Request Retry Status completions (sec
    2.3.1), and we accommodate that in Linux with a 60 second cap
    (PCIE_RESET_READY_POLL_MS).

    Previously we waited up to PCIE_RESET_READY_POLL_MS only in the reset c=
ode
    path, not in the resume path.  However, a device has surfaced, namely I=
ntel
    Titan Ridge xHCI, which requires a longer delay also in the resume code
    path.

    Make the resume code path to use this same extended delay as the reset
    path.

    Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216728
    Link: https://lore.kernel.org/r/20230404052714.51315-2-mika.westerberg@=
linux.intel.com
    Reported-by: Chris Chiu <chris.chiu>
    Signed-off-by: Mika Westerberg <mika.westerberg.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas>
    Cc: Lukas Wunner <lukas>

 drivers/pci/pci-driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


I'm happy to add further details, perform additional debugging, or
test some experimental patches in order to resolve this regression.
Please CC me in your replies, I'm not subscribed to this list. Thank
you!
Kamil P=C3=A1ral


#regzbot introduced: e8b908146d44

