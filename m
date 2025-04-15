Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1612253EA
	for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743564; cv=none; b=HXu4UMbPWOGwuZlq+YwjK40B//fRQRc7DtilyVJ9fJ05WRT/NWaiv3Ut7MHHPVVvGIfcxzTKYrSsQS9zI1ezrDlwg34K0kL3DlMTbpVmLst/pZyuP6KiMIc9rvikxjzR63YRxQx8JcGTzsc06XQ9654KWIztRce8ruy45qT9b4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743564; c=relaxed/simple;
	bh=q70ctjrGqLmxVUHKXN5p9/vzscrDP14u951WDIoOWbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fA5HR5i4cp6nxfSorGNDlyz//3qUMttAsw53KLGfb+DjUi1FQDQGwG7/CNgp83FJTM1HdB+h7Q1o2HcURjn8iG5+HSHFSteoD6YZjt7fTuMND/j4DDlDoRCqVxw/isM7ksYCZYarUwM931Pc3r4RFDPgCt+vZ9j1ppsAT7i7M2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPVtBFPU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPVtBFPU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25d2b2354so934759566b.1
        for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744743561; x=1745348361; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2i5c9bgqxiRKG/3h+HqHChQz8elSJkULnjDgaezo=;
        b=TPVtBFPUtcYkQ5URC0xJY/3aKfd6NEtgqDQgJxE7pnDFvM+cAogQl0g4nfLYKf84z3
         ZI3mxadBmfkSc86U6zp3nslFqp5PuluQkIJnKMydvxDVZOk6jqcTzQgGvBe90aiJOIDS
         V7lql+JACM+l7UUbGgtRkENhNj9qg+YJ5lDVA8L0M0zo0qnJXUYWaUQk25qNinX9LoSk
         0Q/lHc4AuNPmU2hAYotYDD61uwwEa+MsY0/2WUFJ1dMSRClReGG6QaQeIViGR6VEj1jM
         zirX8MuChVFlPVwVrPhgJzRAiT/FGygW7i6ZeOsO2ZdcekHFK6hngdDvxtph3UV7MyR3
         eEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744743561; x=1745348361;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkp2i5c9bgqxiRKG/3h+HqHChQz8elSJkULnjDgaezo=;
        b=td1nkrjePChPMoJ0OynzKBndUQEDMqi2EYjHvwC17yxOQBen1uWshrupbSOb7YogIx
         pQpIaWWeIaDDT9zjngufg6St+xIxdliaHthletaY1hngNI9YMUj7J5DR22ULmrYS5Ba8
         ogp28ueyXqDFMjBHRN2APzhqRqfIraqZ552QkUPz6xKgtmFNvOxKGUe+3PrSP2roMFN0
         aW7ZJ9Ovf3nUBHttYwDRPMoGsDCusf1puh43x1erJSqOvIu7M0ryFy1uqXTZNvn2B6hK
         cioPjpR1URCv/DNkHiWM5vMmX6b3NiKT898dQ8iBZi9Q0CGBc0SBg9NCL4MxtsOBSaAg
         PzEw==
X-Forwarded-Encrypted: i=1; AJvYcCV+SJ+4XZ/8z0J9ealvM+ygnhcc730JILRovOFlPWSJZPIADOLl6ps9Yp4OQx9pVho7RJJaG5uROnOiYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIPtP3UadNDhi34MyPNKZjZOk0iIC2GSBKu2dC7dy69s+wWLPO
	baOzCkHelWEn4/XBcuJsgQn1HgRZVDYXdJ2YOHUqMJnw2LA7L8iy
X-Gm-Gg: ASbGncubnKS/OUYPOZevLzPfLIpUTkPB5crrI7PsjhMOZXXroSXfGLYvBYw8P7G0kO/
	N2gr8yOye4CI7B8l8A/V4Uk4cYWMHr+7YTSOvw8Cy5Z1fOzA0PAg47TBm/Hrk1v3av80UK97BuY
	T+HHZYQhR9dfBiQvoi3VLuMOxhIE1EhWuEQ34fnIFK4M/h0EVnBte72o8BPZhBBixJFUiV4lKlc
	KqGQfHi2LrB4ud9QhLu3SEEIIRJUrv1CI31PD/F5ry0grdSe+AldVKWQSeIU1cyzB2eXbMEiO83
	8PabmuFZhAu4Khggrknm5OKSek5OcXLnAFjE8PxeQGdhXcN83A5zEqFrvcD1k0ej64JRgbcwGg=
	=
X-Google-Smtp-Source: AGHT+IGTCiRplDt7X2b9oOiIqzPnVtzAVrCP2VkK30vBE7aX2MZ8ZaJbKZHqziYeL/Ig1EMQ0/BoBQ==
X-Received: by 2002:a17:907:720a:b0:abf:6cc9:7ef5 with SMTP id a640c23a62f3a-acb3850f00dmr12406966b.47.1744743560630;
        Tue, 15 Apr 2025 11:59:20 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb20c03de9sm177102666b.71.2025.04.15.11.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:59:19 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 25073BE2DE0; Tue, 15 Apr 2025 20:59:19 +0200 (CEST)
Date: Tue, 15 Apr 2025 20:59:19 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: David Howells <dhowells@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Hillf Danton <hdanton@sina.com>,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	regressions@lists.linux.dev, table@vger.kernel.org,
	Bernd Rinn <bb@rinn.ch>,
	Karri =?iso-8859-1?Q?H=E4m=E4l=E4inen?= <kh.bugreport@outlook.com>,
	Milan Broz <gmazyland@gmail.com>,
	Cameron Davidson <bugs@davidsoncj.id.au>, Markus <markus@fritz.box>
Subject: [regression 6.1.y] Regression from 476c1dfefab8 ("mm: Don't pin
 ZERO_PAGE in pin_user_pages()") with pci-passthrough for both KVM VMs and
 booting in xen DomU
Message-ID: <Z_6sh7Byddqdk1Z-@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

[Apologies if this has been reported already but I have not found an
already filled corresponding report]

After updating from the 6.1.129 based version to 6.1.133, various
users have reported that their VMs do not boot anymore up (both KVM
and under Xen) if pci-passthrough is involved. The reports are at:

https://bugs.debian.org/1102889
https://bugs.debian.org/1102914
https://bugs.debian.org/1103153

Milan Broz bisected the issues and found that the commit introducing
the problems can be tracked down to backport of c8070b787519 ("mm:
Don't pin ZERO_PAGE in pin_user_pages()") from 6.5-rc1 which got
backported as 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in
pin_user_pages()") in 6.1.130. See https://bugs.debian.org/1102914#60

#regzbot introduced: 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774

476c1dfefab8b98ae9c3e3ad283c2ac10d30c774 is the first bad commit
commit 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
Author: David Howells <dhowells@redhat.com>
Date:   Fri May 26 22:41:40 2023 +0100

    mm: Don't pin ZERO_PAGE in pin_user_pages()

    [ Upstream commit c8070b78751955e59b42457b974bea4a4fe00187 ]

    Make pin_user_pages*() leave a ZERO_PAGE unpinned if it extracts a pointer
    to it from the page tables and make unpin_user_page*() correspondingly
    ignore a ZERO_PAGE when unpinning.  We don't want to risk overrunning a
    zero page's refcount as we're only allowed ~2 million pins on it -
    something that userspace can conceivably trigger.

    Add a pair of functions to test whether a page or a folio is a ZERO_PAGE.

    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Christoph Hellwig <hch@infradead.org>
    cc: David Hildenbrand <david@redhat.com>
    cc: Lorenzo Stoakes <lstoakes@gmail.com>
    cc: Andrew Morton <akpm@linux-foundation.org>
    cc: Jens Axboe <axboe@kernel.dk>
    cc: Al Viro <viro@zeniv.linux.org.uk>
    cc: Matthew Wilcox <willy@infradead.org>
    cc: Jan Kara <jack@suse.cz>
    cc: Jeff Layton <jlayton@kernel.org>
    cc: Jason Gunthorpe <jgg@nvidia.com>
    cc: Logan Gunthorpe <logang@deltatee.com>
    cc: Hillf Danton <hdanton@sina.com>
    cc: Christian Brauner <brauner@kernel.org>
    cc: Linus Torvalds <torvalds@linux-foundation.org>
    cc: linux-fsdevel@vger.kernel.org
    cc: linux-block@vger.kernel.org
    cc: linux-kernel@vger.kernel.org
    cc: linux-mm@kvack.org
    Reviewed-by: Lorenzo Stoakes <lstoakes@gmail.com>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Acked-by: David Hildenbrand <david@redhat.com>
    Link: https://lore.kernel.org/r/20230526214142.958751-2-dhowells@redhat.com
    Signed-off-by: Jens Axboe <axboe@kernel.dk>
    Stable-dep-of: bddf10d26e6e ("uprobes: Reject the shared zeropage in uprobe_write_opcode()")
    Signed-off-by: Sasha Levin <sashal@kernel.org>

 Documentation/core-api/pin_user_pages.rst |  6 ++++++
 include/linux/mm.h                        | 26 ++++++++++++++++++++++++--
 mm/gup.c                                  | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 60 insertions(+), 3 deletions(-)

Milan verified that the issue persists in 6.1.134 so far and the patch
itself cannot be just reverted.

The failures all have a similar pattern, when pci-passthrough is used
for a pci devide, for instance under qemu the bootup will fail with:

qemu-system-x86_64: -device {"driver":"vfio-pci","host":"0000:03:00.0","id":"hostdev0","bus":"pci.3","addr":"0x0"}: VFIO_MAP_DMA failed: Cannot allocate memory
qemu-system-x86_64: -device {"driver":"vfio-pci","host":"0000:03:00.0","id":"hostdev0","bus":"pci.3","addr":"0x0"}: vfio 0000:03:00.0: failed to setup container

(in the case as reported by Milan).

Any ideas here?

Regards,
Salvatore
