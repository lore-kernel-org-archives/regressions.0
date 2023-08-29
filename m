Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A6156CC
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 15:04:45 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qb0Gn-002a5D-30;
	Tue, 29 Aug 2023 17:04:41 +0200
Date: Tue, 29 Aug 2023 17:04:41 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de>
 <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
 <ZO4GeazfcA09SfKw@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZO4GeazfcA09SfKw@google.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Tue, Aug 29, 2023 at 07:53:45AM -0700, Sean Christopherson wrote:
> What is different between the bad host(s) and the good host(s)?  E.g. kernel, QEMU,

The bad host is an APU ("AMD GX-412TC SOC") with 4 GB of RAM, one of the
good hosts is a "Xeon(R) CPU E3-1246 v3" with 32 GB of RAM. Both are
somewhat dated due to the darn iptables => nftables migration and still
run Debian buster, kernels are identical (a 6.4.12 built in the same
container than the 6.4.12 that works and the 6.5 that misbahaves on the
test VM), system configuration is from the same ansible playbook, but of
course there are differences. But my strongest bet is some weird CPU
type issue becuase that's the most blatant difference.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
