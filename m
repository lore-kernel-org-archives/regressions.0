Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788137B
	for <regressions@lists.linux.dev>; Wed, 15 Feb 2023 07:45:39 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSCTt-0003nC-IK; Wed, 15 Feb 2023 08:45:33 +0100
Message-ID: <c681b612-eda0-e8ed-8be0-ac74867bf8da@leemhuis.info>
Date: Wed, 15 Feb 2023 08:45:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <8cfcf069d48c1b8d7b83aafe0132f8dad0f1d0ea.1676400947.git.linux@leemhuis.info>
 <Y+xWxpuRdtuCpsO6@debian.me>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2] docs: describe how to quickly build a trimmed kernel
In-Reply-To: <Y+xWxpuRdtuCpsO6@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1676447139;2f86ba52;
X-HE-SMSGID: 1pSCTt-0003nC-IK

Thx for your feedback, much appreciated.

On 15.02.23 04:51, Bagas Sanjaya wrote:
> On Tue, Feb 14, 2023 at 07:58:09PM +0100, Thorsten Leemhuis wrote:
>> +   Execute the following command to retrieve a fresh mainline codebase::
>> +
>> +     git clone --no-checkput --depth 1 -b master \
>> +       https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git \
>> +       ~/linux/sources/
>> +     cd ~/linux/sources/
>> +
>> +   If you want to access recent mainline releases and pre-releases, deepen you
>> +   clone's history to the oldest version you are interested in::
>> +
>> +     git fetch --shallow-exclude=v6.0
> 
> For me, another way is to use `git fetch --shallow-since="<some-date>"

Well, that's described in the reference section as an alternative. Did
you miss that, or do you think that --shallow-since should be used by
default for some reasons? If so: which?

> && git repack -a -d`.

`git repack -d` (also mentioned in the reference section of the
submitted text) seems to suffice in my (limited!) testing.

> This requires knowing version release date.

Which is why I (for now!) settled on using "--shallow-exclude=" by default.

> If
> you want that version, the date used should be one or two days before
> that version's release date. Repacking is important!
> 
> Nevertheless, you need to go to Git ML and ask why repacking is required
> in that case (I have tried searching threads there, but inconclusive).

Yeah, I also wonder why the repacking is needed, but chose to not
investigate... Maybe I should have, but writing that text already took
quite some time and effort. :-/

>> +The make target olddefconfig and the ``yes "" |`` used when utilizing
>> +localmodconfig will set any undefined build options to their default value. This
>> +among others will disable many kernel features that were introduced after your
>> +base kernel was released.
>> +
>> +If you want to set these configurations options manually, use ``oldconfig``
>> +instead of ``olddefconfig`` or omit the ``yes "" |`` when utilizing
>> +localmodconfig. Then for each undefined configuration option you will be asked
>> +how to proceed. In case you are unsure what to answer, simply hit 'enter' to
>> +apply the default value.
> 
> olddefconfig and `yes "" | make localmodconfig` can produce different
> config, since the default value for new config symbols may not be Y.
> Often, for new drivers, the default is N.

Are you sure? A `yes ""` doesn't set everything unset to Y, it afaics
just sends an "enter" -- and then the default should be used (as
explained in the documents reference section). Shouldn't the end result
thus be similar? Or am I missing something?

>> + * Remove a stale reference to a certificate file that would cause your build to
>> +   fail::
>> +
>> +    ./scripts/config --file ~/linux/build/.config --set-str SYSTEM_TRUSTED_KEYS ''
>> +
>> +   Alternatively, download the needed certificate and make that configuration
>> +   option point to it, as `the Debian handbook explains in more detail
>> +   <https://debian-handbook.info/browse/stable/sect.kernel-compilation.html>`_ .
>> +
> 
> Another way is to generate the certificate yourself (see
> Documentation/admin-guide/module-signing.rst for the instructions).

Ohh, thx, yeah, I guess I should refer to that file here and in another
place, even if it requires a lot more from the reader. :-/

Ciao, Thorsten
