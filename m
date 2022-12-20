Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125297E
	for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 12:20:42 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7bBg-0005om-AI; Tue, 20 Dec 2022 12:53:36 +0100
Message-ID: <7043e971-c320-b1aa-8e7c-35df0eceb16c@leemhuis.info>
Date: Tue, 20 Dec 2022 12:53:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Content-Language: en-US, de-DE
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 yung-chuan.liao@linux.intel.com, Takashi Iwai <tiwai@suse.de>,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Zhen Ni <nizhen@uniontech.com>, ranjani.sridharan@linux.intel.com,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, peter.ujfalusi@linux.intel.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
 <Y6BhTWGUp2D5hhbE@sirena.org.uk>
 <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671538843;063cd66c;
X-HE-SMSGID: 1p7bBg-0005om-AI

On 20.12.22 12:41, Kai Vehmanen wrote:
> 
> On Mon, 19 Dec 2022, Mark Brown wrote:
> 
>> On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
>>
>>> * there are no "CC: <stable..." tags in these patches. Is the plan to
>>> manually ask for a backport? Or how can we get the regression fixed in
>>> older releases?
>>
>> Speak to the stable maintainers I guess, or hope their bot picks the
>> commits up.
> 
> thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
> it's possible the bots will not pick these up. I can follow up and send 
> these to stable if this does not happen.

Thanks, that would be great, I try to stay out of that business, as
actual developers of the code in question are in the best position to
judge and handle things like this.

Ciao, Thorsten
