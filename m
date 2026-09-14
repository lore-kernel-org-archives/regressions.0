Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE05445AC8
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386618; cv=none; b=t9cZNL0p1XRSTkkWE6SLoCly/tYVrC3hF1uincMiHEiDwXyhWGa4D2miSPn6F0KNH5fHpjb838gjOSCAMDoFqZXS/kKxHIc08me17Lq+FQmJ9PRrDN4Sk2JZ066FW0vC9pBkzAliJGXeldTiExGT/+bxpU8Ow6Io59Ty9IXxtdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386618; c=relaxed/simple;
	bh=Q8ksi+xZgxIagv9+QQVvkuR0wfKZoHt0nu/3YJrwAf8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBrp3oxZ1MJYkqea0iV5UA+A7LJ8M7sUcboi7S2iSmfR1tIlN2+aRSqpxP9bA9PZP2kqIBlGHsM0iB3C5N9V+PppIapPZ6ElstyiBx5MKpfZ+b/w73CM1ENDmRV+mKxmHVMJ+loN5rkhtP9BB7yylSIwHvuwMhiHisSqMndwonI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LIFbV8t5; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LIFbV8t5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso359612766b.1
        for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789386614; x=1789991414; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3d/NyVwn33xRXNwAVXKr9GMiiFtUoOWjxTC/8TNYXw=;
        b=LIFbV8t5m0FwRsRUPvNsvym9877/IV8mL10lBK/UUIKAMtan9OVeWXNo0LVaB+Foqt
         qsrib1RWkUMz02MjITC0wiXWlwLssnWba4rDsqzIzBfaqjuUuHv3U7j0xJ290KJEj4mC
         gtKb8kftPAMXM/WpLwFo/bSOPH/bll+O5F9PJuibPhLy+0xKv+ZLFVf8C8NcTv+GrOf3
         InkYNepTBDrqfiCIhkIZSFfwPWJNOQzmmub6pNtLhAXZGwziUwAlQy5VSdsf4RmJk5vD
         aQgK9V2ImLfdg8yx2ogrFN21fTNNh1qwV6L8MfN19UQgcKm1WxOxkEG3KRE4tdo8RZmR
         PsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386614; x=1789991414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b3d/NyVwn33xRXNwAVXKr9GMiiFtUoOWjxTC/8TNYXw=;
        b=hWRmR6Fdmcy7CZpNbltJE1p0qh4jxaxCPCtx/zD8jGIwnPrOsHL8K4SZ9GZjVTFx8S
         qAGRtYav8Ewkabv6X8C9yOsnMM5/UXnAsZFY+rXM4hqGbesjy/5OlmpGN1P6mdTxnVek
         zhQoTGKjeC0PZtgefK7VjtweFPJK7af+CCvgkUVESMQEjnCcOv3OadIG16HdWgydH0zd
         owwBTnCjJBob6/Jkp3jcuM926ZaifUW8qRvBXdEJAG2zJi6NmM4NXklogf5HhwEZzi8w
         tUDf9Y++9TiYKYw2kXxPR6cCoQbvCxoxqpVAliL6bDqwqt/olpRisnCVzs9NeqwmUKVE
         EW5A==
X-Forwarded-Encrypted: i=1; AKwUvBw+p56WeiWLe5bdno8uyf6aV3lnE+FdV2E2esef3GBCiTXieheGBROtZ3MAm61EJg8JgPSw1PWJp8dvkw==@lists.linux.dev
X-Gm-Message-State: AFuF++nJqCAH/pLdMpH9AnDGhdXEcCkuiHrnDxdBxXo+NMluL8jwtIty
	qHoLEfUTeEUDqQjNyI7ZKHaclnmTTtlPpkanUqccgK5J9WCrTMHxjZkk24WkplxcxiI=
X-Gm-Gg: AYBFou17rDlOLldqzu7MTIvfjE0bE2r3LCiHqBT56ld68Dew3BUzF9ELjpFa++7m0uv
	yuSG2rYbrXLPanU9xpi/rhl74MGUR0x6gI44P3xiJVATsrG0ftGIIJnUhNPg08IxVe3SIo6W2L1
	R4tsl7xknfbSiz9/kVkzlC5ot4cSBdGzERhZWUUQdoeG7bVBMRZr1z29AmxubnlJdVLaclTMMnx
	ceqWK+rKiIz7Sy0645AIjXvNoZR3rY68V3I82ZCj+HJKFagJpu6zxdOJ47EKwjeRCqrLiO4uL2X
	3ZtDQaeuilv2ZLCeSfHxvL+zgZoVaEjM6kZ2OYmJV+ARWffyXoEmyjnbZ/P35crwbxb4KmQhEvO
	s4dbjE4I6z0IVhKz72Rc3gdXX+x1EEnsALZVLnMwTvs7aWxNwk5ce5Lxack0KouvY0Ky0yhu/Pc
	7yIjB+Jb38zqrNgW832TTCFU9WoZBQNsSbtl4XhBeOIwPXR9vjhSqwW1nbXr700FqEmk4=
X-Received: by 2002:a17:907:3e07:b0:c25:8c05:902f with SMTP id a640c23a62f3a-c29b86b7559mr277818766b.13.1789386614302;
        Mon, 14 Sep 2026 04:50:14 -0700 (PDT)
Received: from localhost ([82.145.119.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm415116366b.4.2026.09.14.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:50:13 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 14 Sep 2026 13:53:53 +0200
To: Angel J <iamanaws@httpd.dev>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"andrea.porta@suse.com" <andrea.porta@suse.com>,
	"florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>
Subject: Re: [REGRESSION] PCI: Dynamic OF node creation hangs on invalid
 bridge configuration
Message-ID: <aqfgUUkZYZg6ZABF@apocalypse>
References: <GXe6anuewkS4bLNwca3cYOmUxN9csc0TxLYGSBc1qNRmfrmvFlcmD62wEM23TxfzfuXAv4P3yvUv7pyraleARrL1Na-aN8w-t9uc1Igu8DA=@httpd.dev>
 <cFJoUZ6c5g5YbFCrwUnx6RlitHRl-0cS2fadDSFJNf9SgLreKutrmZj1r56hFh8ZUAbzvuCqBG4w9ZYAE8xAWP9HnLwbjMOBzac-iMnMMZc=@httpd.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cFJoUZ6c5g5YbFCrwUnx6RlitHRl-0cS2fadDSFJNf9SgLreKutrmZj1r56hFh8ZUAbzvuCqBG4w9ZYAE8xAWP9HnLwbjMOBzac-iMnMMZc=@httpd.dev>

Hi Angel,

On 23:01 Fri 11 Sep     , Angel J wrote:
> Hi Andrea, Hervé, Bjorn, Thorsten,
> 
> Thanks for the guidance, it was very useful. I went back through the tests
> and got some more insight into the hang.
> 
> Andrea wrote:
> > Angel, could you please provide the following output:
> >
> > lspci -nn
> > setpci -s 00:00.0 HEADER_TYPE
> >
> > from a running (i.e. with CONFIG_PCI_DYNAMIC_OF_NODES=n) system?
> 
> On Linux 6.12.109, with CONFIG_PCI_DYNAMIC_OF_NODES disabled, the relevant
> output is:
> 
>   $ lspci -nn
>   00:00.0 PCI bridge [0604]: Intel Corporation Device [8086:4c43] (rev 01)
> 
>   $ setpci -s 00:00.0 HEADER_TYPE
>   01
> 
>   $ setpci -s 00:00.0 PRIMARY_BUS SECONDARY_BUS SUBORDINATE_BUS
>   ff
>   ff
>   ff

So it seems that a device which is reported as a PCI bridge does not manage any
bus underneath.

> 
> The device is bound to icl_uncore. I get the same values on the patched
> kernel with CONFIG_PCI_DYNAMIC_OF_NODES=y.
> 
> Hervé wrote:
> > Is this PCI logs reported with PCI_DYNAMIC_OF_NODES=y or PCI_DYNAMIC_OF_NODES=n
> > or always whatever the PCI_DYNAMIC_OF_NODES Kconfig value ?
> 
> The messages appear on successful boots with either setting:
> 
>   pci 0000:00:00.0: [8086:4c43] type 01 class 0x060400 conventional PCI bridge
>   pci 0000:00:00.0: bridge configuration invalid ([bus ff-ff]), reconfiguring
> 
> I confirmed this on 6.12.107 with the option disabled and 6.12.108 with it
> enabled. They also appear on the patched 6.18.44 kernel.
> 
> Bjorn wrote:
> > I don't think 49d63971f963 ("misc: rp1: RaspberryPi RP1 misc driver")
> > is a likely culprit by itself because there's just nothing there that
> > looks like it would relate to a Dell XPS 8940.
> 
> That change exposed the problem by enabling PCI_DYNAMIC_OF_NODES in my
> configuration. I bisected again with the option enabled throughout and
> found an earlier boundary:
> 
>   3dc8adeeefa0  PCI: of_property: Constify parameter in of_pci_get_addr_flags()
>   1f340724419e  PCI: of: Create device tree PCI host bridge node
> 
> The first is the direct parent of the second. I boot-tested both without
> any guard, changing only the source commit; their generated kernel
> configurations are identical.
> 
> All of these tests have CONFIG_PCI_DYNAMIC_OF_NODES=y:
> 
>   Source         Change             Result
>   3dc8adeeefa0    None               Boots
>   1f340724419e    None               Hangs
>   1f340724419e    Subordinate guard  Boots
>   6.18.44        None               Hangs
>   6.18.44        Subordinate guard  Boots
> 
> Hervé wrote:
> > Maybe the test done at [1] should be improved to detect those wrong bridges.
> > and skip the of_pci_make_dev_node() call when a wrong bridge is detected.
> 
> I added logging to the first bad commit to check the bridge scan. It shows
> that 00:00.0 has no subordinate bus after either pass, despite satisfying
> pci_is_bridge():
> 
>   pci 0000:00:00.0: PCI OF debug: scan pass 0, buses ff/ff/ff
>   pci 0000:00:00.0: PCI OF debug: scan pass 0 done, subordinate bus absent
>   pci 0000:00:00.0: PCI OF debug: scan pass 1, buses ff/ff/ff
>   pci 0000:00:00.0: PCI OF debug: scan pass 1 done, subordinate bus absent

This is confirmed by the BIOS/fw not filling the bus range and by the kernel
failing to reallocate the bus since the range registers are probably read-only.
Apparently this is not a bridge, it should be at most a host controller.

> 
> of_pci_prop_bus_range() dereferences pdev->subordinate without checking it.
> of_pci_prop_intr_map() also uses that pointer. Before 1f340724419e,
> of_pci_make_dev_node() returns because the parent OF node is missing on
> this ACPI system. That commit creates the parent node, allowing property
> generation to reach the unchecked access.
> 
> My earlier report overstated the device_type="pci" result. The minimal-node
> test that hung added device_type, bus-range and interrupt-map together;
> I haven't confirmed a hang with device_type alone.
> 
> I tested this guard in of_pci_make_dev_node(), before node creation:
> 
>   if (pci_is_bridge(pdev) && !pdev->subordinate)
>           return;

Not sure, maybe can it be considered a hw bug? If this is the case, we can maybe
add a quirk for this device. Could you please test adding a quirk as PCI_FIXUP_HEADER
in which you downgrade the class from 0604 to 0600 and see it works even without
your proposed check in of_pci_make_dev_node()?

If this works, maybe we can just turn the body of your conditional into just an error
log plus fast exit, because a bridge must have valid subordinate.

Many thanks,
Andrea

> Both the first bad commit and 6.18.44 boot with it. The 6.18.44 test uses
> only the guard, without diagnostic logging. The host OF node and the nodes
> for bridges 00:01.0 and 00:1c.0 are still created; 00:00.0 is skipped.
> 
> This points to the NULL subordinate pointer as the cause of the hang,
> although I still don't have a crash trace from an unguarded boot. I'll
> send the patch as a reply to this email. Is of_pci_make_dev_node() the
> right place for this check?
> 
> #regzbot introduced: 1f340724419eda8ab07a20edcaf5ec8f70134231
> 
> Thanks,
> Angel J



