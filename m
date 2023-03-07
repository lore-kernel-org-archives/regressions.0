Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EB6FC5
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 14:25:11 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
	by mailbackend.panix.com (Postfix) with ESMTPA id 4PWHln2L79z3lMq;
	Tue,  7 Mar 2023 09:25:09 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1678199109; bh=iKqTJyMs5p6z903qrfFiEeNAVFvQQXAKyI9pBRJ4e6s=;
	h=In-Reply-To:References:Date:Subject:From:To:Cc;
	b=JxbBMj699F6EU7HWKALZnxSV7OJjEWB+o+/YIgKIV2aJOysy1XhcUMwxKWbTvwuHH
	 6HUX8st8idLfbejXC+dF3zmNuxVwY9oJo8icEeBugAkKA3I2+yiO/aLgdTbGFEf7gH
	 F/KBC3GGnxhiQB47OGLEH/R1X35KgCbchRpGTg7w=
X-Panix-Received: from 166.84.1.3
        (SquirrelMail authenticated user pa@panix.com)
        by mail.panix.com with HTTP;
        Tue, 7 Mar 2023 09:25:09 -0500
Message-ID: <220898e2276e4cae2572eb8f006f3a7b.squirrel@mail.panix.com>
In-Reply-To: <20230307093308.m5enhuegm3r4qwvo@pengutronix.de>
References: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
    <20230307093308.m5enhuegm3r4qwvo@pengutronix.de>
Date: Tue, 7 Mar 2023 09:25:09 -0500
Subject: Re: [Regression] acpi: laptop panics early in boot
From: "Pierre Asselin" <pa@panix.com>
To: "Uwe Kleine-Koenig" <u.kleine-koenig@pengutronix.de>
Cc: "Pierre Asselin" <pa@panix.com>,
 linux-acpi@vger.kernel.org,
 regressions@lists.linux.dev,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
User-Agent: SquirrelMail/1.4.23-p1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal


5.19: good.
5.19+Uwe's patch: bad.

Slightly different traceback,
https://www.panix.com/~pa/linux-6.1.12-crash/boot-failure-5.19-patched.jpg


