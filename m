Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D2B6FC7
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 18:48:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AE3A284FB3;
	Sun, 13 Nov 2022 19:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1668365324;
	bh=u6LjaDcZN7FiuqGgRMUt8yy4yxHrbqA4kHRpJaldoxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o2NlBs8DjFfYHgVQtjQwssKNVVIc+OjnhFsvu/mUxxby8OTnaqggFQeBhkrsOzIJ/
	 Uzf1uR+WLKlY63yllym4UW81XxSjRj4js55P54yGDpH6WbpISySQ1gy5zJ8WOMKiEG
	 BpQ87HroneQVj9p03su2n+xdEWeDe3GskvQV7siHQdW7oKOPSXYFFKPCv0ejq0MIA3
	 1VQHHqAPpVJ1fiKazJdaGa2RFyws5Nlq2S+rDsoI1ZHlOV5lgNYH1fgi8K4SlQ9HXO
	 kQW8ztG69dvg9ZDUZ2e5UOf642Pbb+TCZVh8BBecQb3+33SsCrJg6Ui0b6H8lLeff2
	 Kas6CctfXvltg==
Message-ID: <576b2fe7-4753-73c3-f2f1-0387da175ad9@denx.de>
Date: Sun, 13 Nov 2022 19:48:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
To: Peter Rosin <peda@axentia.se>, linux-usb@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>,
 regressions@lists.linux.dev
References: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean

On 11/13/22 17:59, Peter Rosin wrote:
> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>> which can expose details collected by the TUSB320 in a far more
>> precise way than extcon. Since there are existing users in the
>> kernel and in DT which depend on the extcon interface, keep it
>> for now.
>>
>> Add TYPE-C interface and expose the supported supply current,
>> direction and connector polarity via the TYPE-C interface.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Hi!
> 
> I'm very sad to report that this patch has caused a severe
> regression for our devices. They can no longer be powered by simply
> sticking a USB cable into their USB ports (they keep resetting
> when the tusb320 driver probes), and they reset (and keep resetting)
> if a USB cable is connected while the device is powered by other
> means.
> 
> We have no connector node nor any typec-power-opmode property
> in the device tree, so the mere touching of the new registers
> happening in this patch is enough to cause the resets.
> 
> The devices were fine before this patch, and reverting on top
> of a recent linus master (4bbf3422df78, from 11/11) makes the
> problem go away.
> 
> Any suggestions?

Can you test:

341fd15e2e18c ("extcon: usbc-tusb320: Call the Type-C IRQ handler only 
if a port is registered")

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=341fd15e2e18c24d5c738496cfc3d7a272241201

?
