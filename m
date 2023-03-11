Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4937B;
	Sat, 11 Mar 2023 14:23:03 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 3C61C26F8D9; Sat, 11 Mar 2023 15:22:56 +0100 (CET)
Date: Sat, 11 Mar 2023 15:22:56 +0100
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Wetzel <alexander@wetzel-home.de>, Ilya <me@0upti.me>,
	Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	asahi@lists.linux.dev
Subject: Re: [PATCH] wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use
 after free for wext"
Message-ID: <20230311142256.GH24656@jannau.net>
References: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
 <20230311141914.24444-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311141914.24444-1-marcan@marcan.st>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-03-11 23:19:14 +0900, Hector Martin wrote:
> This reverts part of commit 015b8cc5e7c4 ("wifi: cfg80211: Fix use after
> free for wext")
> 
> This commit broke WPA offload by unconditionally clearing the crypto
> modes for non-WEP connections. Drop that part of the patch.
> 
> Fixes: 015b8cc5e7c4 ("wifi: cfg80211: Fix use after free for wext")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-wireless/ZAx0TWRBlGfv7pNl@kroah.com/T/#m11e6e0915ab8fa19ce8bc9695ab288c0fe018edf
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  net/wireless/sme.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
> index 28ce13840a88..7bdeb8eea92d 100644
> --- a/net/wireless/sme.c
> +++ b/net/wireless/sme.c
> @@ -1500,8 +1500,6 @@ int cfg80211_connect(struct cfg80211_registered_device *rdev,
>  		connect->key = NULL;
>  		connect->key_len = 0;
>  		connect->key_idx = 0;
> -		connect->crypto.cipher_group = 0;
> -		connect->crypto.n_ciphers_pairwise = 0;
>  	}
> 
>  	wdev->connect_keys = connkeys;

Tested-by: Janne Grunau <j@jannau.net>

thanks,

Janne
