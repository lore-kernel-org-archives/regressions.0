Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B611FCF
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 16:46:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D73F868AFE; Wed, 12 Jul 2023 18:45:47 +0200 (CEST)
Date: Wed, 12 Jul 2023 18:45:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Keith Busch <kbusch@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Clemens S." <cspringsguth@gmail.com>,
	Martin Belanger <martin.belanger@dell.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux NVMe <linux-nvme@lists.infradead.org>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Javier Gonzalez <javier.gonz@samsung.com>,
	=?utf-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Message-ID: <20230712164546.GA31434@lst.de>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com> <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com> <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info> <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com> <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com> <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com> <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info> <20230711120609.GB27050@lst.de> <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 11, 2023 at 09:47:00AM -0700, Linus Torvalds wrote:
> Anybody who expected unique ID's is frankly completely incompetent.
> People should have *known* not to do this.

Except that storage software really does rely on them.  Not your
laptop (or mine) but all kinds of data center software.  Where these
IDs have worked fine for decades.  It just turns out nvme has the
misfortune of trying to deal with both that and cheap consumer crap.

> and we have NEVER EVER seen devices with reliably unique IDs. Really.

Sorry, but that's bullshit. 

> iow, the code even checks for and *notices* that there are duplicate
> IDs, and what does it do? It then errors out.

Yes.  Because we have applications which will lose data if they
suddently get the wrong device.  

> I think the code should *default* to "unreliable uuid", and then if
> you're sure it's actually ok, then you use it. Then some rare
> enterprise user with multipathing  - who is going to be very very
> careful about which device to use anyway - can use the "approved
> list".

That doesn't scale either.

> Or "Oh, I noticed a non-unique UUID, let me generate one for you based
> on physical location".
> 
> But this "my disk doesn't work in v6.0 and later because some clown
> added a duplicate check that shouldn't be there" is not a good thing
> to then try to make excuses for.

Well, let's try something like this (co-developed with Sagi) that
allows it for non-multipath PCIe devices, hich covers the quirks
we've added so far, but also add a big fat warning, because we know
people rely on the /dev/disk/by-id/ links.  Probably not on these
devices, but who knows.

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 47d7ba2827ff29..37b6fa74666204 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3431,10 +3431,40 @@ static int nvme_init_ns_head(struct nvme_ns *ns, struct nvme_ns_info *info)
 
 	ret = nvme_global_check_duplicate_ids(ctrl->subsys, &info->ids);
 	if (ret) {
-		dev_err(ctrl->device,
-			"globally duplicate IDs for nsid %d\n", info->nsid);
+		/*
+		 * We've found two different namespaces on two different
+		 * subsystems that report the same ID.  This is pretty nasty
+		 * for anything that actually requires unique device
+		 * identification.  In the kernel we need this for multipathing,
+		 * and in user space the /dev/disk/by-id/ links rely on it.
+		 *
+		 * If the device also claims to be multi-path capable back off
+		 * here now and refuse the probe the second device as this is a
+		 * recipe for data corruption.  If not this is probably a
+		 * cheap consumer device if on the PCIe bus, so let the user
+		 * proceed and use the shiny toy, but warn that with changing
+		 * probing order (which due to our async probing could just be
+		 * device taking longer to startup) the other device could show
+		 * up at any time.
+		 */
 		nvme_print_device_info(ctrl);
-		return ret;
+		if ((ns->ctrl->ops->flags & NVME_F_FABRICS) || /* !PCIe */
+		    ((ns->ctrl->subsys->cmic & NVME_CTRL_CMIC_MULTI_CTRL) &&
+		     info->is_shared)) {
+			dev_err(ctrl->device,
+				"ignoring nsid %d because of duplicate IDs\n",
+				info->nsid);
+			return ret;
+		}
+
+		dev_err(ctrl->device,
+			"clearing duplicate IDs for nsid %d\n", info->nsid);
+		dev_err(ctrl->device,
+			"use of /dev/disk/by-id/ may cause data corruption\n");
+		memset(&info->ids.nguid, 0, sizeof(info->ids.nguid));
+		memset(&info->ids.uuid, 0, sizeof(info->ids.uuid));
+		memset(&info->ids.eui64, 0, sizeof(info->ids.eui64));
+		ctrl->quirks |= NVME_QUIRK_BOGUS_NID;
 	}
 
 	mutex_lock(&ctrl->subsys->lock);
