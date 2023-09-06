Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B26AB3
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 20:19:02 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qdyzG-006ZTz-1m;
	Wed, 06 Sep 2023 22:18:54 +0200
Date: Wed, 6 Sep 2023 22:18:54 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Tony Lindgren <tony@atomide.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZPjernao1DVQouhb@torres.zugschlus.de>
References: <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
 <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
 <20230906152616.GE11676@atomide.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230906152616.GE11676@atomide.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Wed, Sep 06, 2023 at 06:26:16PM +0300, Tony Lindgren wrote:
> * Marc Haber <mh+linux-kernel@zugschlus.de> [230906 14:41]:
> > With my tools I have found out that it really seems to be related to the
> > CPU of the host. I have changed my VM definition to "copy host CPU
> > configuration to VM" in libvirt and have moved this very VM (image and
> > settings) to hosts with a "Ryzen 5 Pro 4650G" and to an "Intel Xeon
> > E3-1246" where they work flawlessly, while on both APUs I have available
> > ("AMD G-T40E" and "AMD GX-412TC SOC") the regression in 6.5 shows. And
> > if I boot other VMs on the APUs with 6.5 the issue comes up. It is a
> > clear regression since going back to 4.6's serial code solves the issue
> > on the APUs.
> 
> Not sure why the CPU matters here..

Neither am I.

> One thing to check is if you have these in your .config:
> 
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y

That's affirmative. Otherwise, I think that serial console wouldn't work
at all, but I get early kernel messages just fine and even at normal
speed.

> Or do you maybe have CONFIG_SERIAL_CORE=m as loadable module?

Negative.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
