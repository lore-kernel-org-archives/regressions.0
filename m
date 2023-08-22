Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284262B540
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692722240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnGdXfhYpeYSemU19xhB8UMjBrCGspmXkJpZEmSbZjM=;
	b=epWEZhn92Ub8WGEgP/3k7iEceTqr5JX5EQ/tfShTDBtUIX7RhnIwFWOWvV3j928VNvR7Nr
	7lIR4r1h5AiN32pkZm3GRIaUOLZ7dVIbs9ufYwwj16RuB5y0gpBvDyNtNDDZsdbmM2/A21
	4XB/hKdDhCbVxkU5S6tfVIi+ulr0XeU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-eCAj5m1DMAml1V6-JXHqYg-1; Tue, 22 Aug 2023 12:37:18 -0400
X-MC-Unique: eCAj5m1DMAml1V6-JXHqYg-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-56c379a8250so2286244a12.0
        for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 09:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692722237; x=1693327037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnGdXfhYpeYSemU19xhB8UMjBrCGspmXkJpZEmSbZjM=;
        b=QVv+531h3+1tkHmCLfcw10gQcdUry0JVF508mU3gxohRpCQa55brja6TL4Ts7gvndl
         dRcmqUeDG0d8+lMnP69bNQ3Pd/XVrY55DRyDtq0Ydnu3k4N18tQ25tQhaaVTGfV6zgYt
         0rylSJ78rWUnp2QA2O3geS3JbtmEno9bUbAlD+5R6504v8tdRogn0+4APIDmuCMv+orG
         eBM4BANtNrhEUZ99ebCU389PEDKqx41illeJ/vCW9dYAnKUmL/jfPNkoGCQRB/BaX5Jm
         CKCDMQx/yeEo4FrlLlc3xDZUMR0KajUDUe/hQrvgVDdmyxjhG0tGWygHlhtip2RTLlAg
         pjeQ==
X-Gm-Message-State: AOJu0Yw+9O8DFGqaX87i/sFV8KeW5SCX57YH7cGFETpzpDrnHhIAOwns
	pi/9OLy3BxHIOmSrgCStF3ItoS0jLgDyhBzFrl2QJhCGefggRbVkEtIe5Jiz/AJDHuOsbJ6Jm31
	vYrLI9+cgbaC73+6M2YtNApIYBKtMNgXYvKxIrQ==
X-Received: by 2002:a17:90a:6bc2:b0:269:5adb:993 with SMTP id w60-20020a17090a6bc200b002695adb0993mr6518742pjj.22.1692722237551;
        Tue, 22 Aug 2023 09:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKrBspwI7hWFcRVdnctcIzftV6xUGBzXsFOt81Kbgvk/KkCkDNG8gw4FZ7HQ3q4DafK7fwpPZsU7HhpPwhAHs=
X-Received: by 2002:a17:90a:6bc2:b0:269:5adb:993 with SMTP id
 w60-20020a17090a6bc200b002695adb0993mr6518726pjj.22.1692722237206; Tue, 22
 Aug 2023 09:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821191055.GA362994@bhelgaas>
In-Reply-To: <20230821191055.GA362994@bhelgaas>
From: Kamil Paral <kparal@redhat.com>
Date: Tue, 22 Aug 2023 18:36:50 +0200
Message-ID: <CA+cBOTfRbok8D+J-SuxWYoDbJT_uOG6CJ4Y4rqvYNAjq5G-Mvw@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	mika.westerberg@linux.intel.com, bhelgaas@google.com, 
	chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 9:20=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
> Wow, this is super interesting.  e8b908146d44 literally just increases
> a timeout; the complete patch is:
>
>    static void pci_pm_bridge_power_up_actions(struct pci_dev *pci_dev)
>    {
>   -       pci_bridge_wait_for_secondary_bus(pci_dev, "resume", PCI_RESET_=
WAIT);
>   +       pci_bridge_wait_for_secondary_bus(pci_dev, "resume",
>   +                                         PCIE_RESET_READY_POLL_MS);
>
> Increasing a timeout should never cause a failure like this, so
> there must be something really unexpected going on.

Hello Bjorn, thanks for a quick response.

Your reply helped me discover that the laptop doesn't really *fail* to
resume, it just makes the resume much *longer*. I just never waited
that long. PCI_RESET_WAIT is 1 second, PCIE_RESET_READY_POLL_MS is 60
seconds. If I wait long enough, the laptop finally resumes correctly
after roughly 70 seconds (before the patch the resume took roughly 5
seconds). Sorry for not spotting that earlier!

I also tested this with the current git master tip (commit
f7757129e3de). Without any adjustments, the resume delay is roughly 70
seconds. But if I change PCIE_RESET_READY_POLL_MS from 60 seconds to 2
seconds and recompile it, the resume delay is roughly 6 seconds.

With the latest kernel f7757129e3de, here are some debugging logs:
* dmesg collected after delayed resume (extra 60 seconds):
  https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984636
* system journal after delayed resume:
  https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984637
* lspci -vv before suspend:
  https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984638
* lspci -vv after delayed resume:
  https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984639


> Would you mind
> collecting the output of "sudo lspci -vv" both with and without
> "pcie_aspm=3Doff"?  No need to try suspend/resume to collect these.
>
> Also, what does this race condition look like?  Dock devices are
> visible before suspend, but sometimes none of them are visible *after*
> resume?  We don't re-enumerate on resume, so does this mean they still
> appear in lspci output but they just don't work?

I didn't manage to debug this today. Given the newly discovered
circumstances described above, I wonder whether your request still
applies. If it does, I can provide it tomorrow.

Thanks for looking into this,
Kamil P=C3=A1ral

