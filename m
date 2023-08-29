Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6E17751
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 20:01:01 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qb4tW-002gGn-0c;
	Tue, 29 Aug 2023 22:00:58 +0200
Date: Tue, 29 Aug 2023 22:00:58 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de>
 <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
 <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
 <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZO4nbzkd4tovKpxx@google.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

Hi,

On Tue, Aug 29, 2023 at 10:14:23AM -0700, Sean Christopherson wrote:
> On Tue, Aug 29, 2023, Marc Haber wrote:
> > Both come from virt-manager, so if the XML helps more, I'll happy to
> > post that as well.
> 
> Those command lines are quite different, e.g. the Intel one has two
> serial ports versus one for the AMD VM.

Indeed? I virt-manager, I don't see a second serial port. In either case,
only the one showing up in the VM as ttyS0 is being used. But thanks for
making me look, I discovered that the machine on the Intel host still
used emulated SCSI instead of VirtIO für the main disk. I changed that.

>Unless Tony jumps in with an
> idea, I would try massaging either the good or bad VM's QEMU
> invocation, e.g. see if you can get the AMD VM to "pass" by pulling in
> stuff from the Intel VM, or get the Intel VM to fail by making its
> command line look more like the AMD VM.

In Virt-Manager, both machines don't look THAT different tbh. I verified
the XML and the differences are not big at all.

Do you want me to try different vCPU types? Currently the VM is set to
"Opteron_G3", would you recommend a different vCPU for the host having a
"AMD GX-412TC SOC" host CPU?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
