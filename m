Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90E7E
	for <regressions@lists.linux.dev>; Sat, 21 May 2022 23:28:36 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.107]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MtfRp-1naCv71a5H-00v56E; Sun, 22 May 2022 01:22:02 +0200
Message-ID: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
Date: Sun, 22 May 2022 01:22:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marcelo Tosatti <mtosatti@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Juri Lelli
 <juri.lelli@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Phil Elwell <phil@raspberrypi.com>, regressions@lists.linux.dev
From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: vchiq: Performance regression since 5.18-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rd1cpxzMrn3SOHrTFF5zZUZ+MyEdYrLnnFtzNhw6NDyO+22glyu
 r0DsQ26+qvx7bbyHXAbhlpFs7NcpxGkkiPsahc6ylqEqE7yzbcdGXMkT5GCTU6EzkNaFNbV
 DH5rSUxT4TsO6SX5yC7dQcUnMd0IpcqFKHV8pZVLKeTN5IzMFNeeqy1I812kZxKOuFHjxDw
 r9Ff3KZtGm3XuAGsCR08A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FsoeVz1q9aE=:GGjM1Vo99WAQVIVm+e7wzA
 SjBk4BAa5vtxd+sYEih7pZdDURgEUwupCM0LA62uWqCUodSXxz0KtKfIvfslCSBkWijJOsQwc
 5z8xMCLiaUuMzKdTMPp1NgofbjKU1plRK0yo3L7Juc1he36dOEW6QCTHkCNbD7QZonhAeeMdV
 xIaOmByrWGxIAvdNFTNAkqnGbTU1x7ouvHSlavIIaZ03gHLQOEIsmw7msoE/to/GrbUdT/bzy
 HFT2XP5BJLukHEBRUUeei9M3enQTUzOF8JZI6CEalBvCqxU1t/nNMz/iNi4DiwrReuhbh4Le+
 oYVzyoxvidWgKq8f9AOph8QLE7rOoTp5mRHNnYjajJQcnWwgmq9H61+LtpwNgPMgHYAibBRD9
 LaJMpzmc7+daQgoqMFG7KTinKEnVURFFrjkIzKl1fVefVM44tBFulnl+H2HqyGgHo0vkrqLK8
 rwS4WufVAHnMKARk3uVqwdxKSXrXROi/O6fEnCy+sxUjjGn0fEBQkKGAoz7P7ah/LnRUy+nR3
 gnpQpBOrmmfkMl8nAiI672rnJTMwbQDUqiJtiRJJa2blqrhjfl1foLtklwnMU8yJQ6wWgRxY3
 UWkvLZz744cpyhYIZQ3Q8CTdo3vAuJzph1v2H81qKevM9rjr1rGAu6omEIFWmkV4Ey1VDw3jB
 nUJElb8Ti+OQIDZm/0AsgDocoinWxxpshwf85oCcyfh5dtnUgWbGpJMN/Y+CY3nZeO5zV4xEA
 G/2GfK512e7JoULGmFkr26P6VrLVNTKtyHFnrflXTkMyS52KuNky3pEkL2U=

Hi,

while testing the staging/vc04_services/interface/vchiq_arm driver with 
my Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance 
regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm: 
lru_cache_disable: replace work queue synchronization with synchronize_rcu

Usually i run "vchiq_test -f 1" to see the driver is still working [1].

Before commit:

real    0m1,500s
user    0m0,068s
sys    0m0,846s

After commit:

real    7m11,449s
user    0m2,049s
sys    0m0,023s

Best regards

[1] - https://github.com/raspberrypi/userland


